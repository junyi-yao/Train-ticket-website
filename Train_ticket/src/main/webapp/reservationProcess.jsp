<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="group14_train.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.sql.Date,java.text.SimpleDateFormat"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<% 	
	double discountNum = 1.0;
	double fare = 0.0;
	double total_fare = 0.0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
				
				//Create a SQL statement
				Statement stmt = con.createStatement();
				String user_type_str = (String)session.getAttribute("type");
				String username_str = (String)session.getAttribute("username");
				String query = null;
				if(user_type_str.equals("Customer")){
					/*query = "select * from Customer where username='"+ username_str + 
							"' and password='" + password_str + "';";
					ResultSet result = stmt.executeQuery(query);
					boolean success = result.first();
					result.close(); */
					/* if(success){ */
						String depart = request.getParameter("Origin");
						//session.setAttribute("Origin", depart);
						String arrival = request.getParameter("Destination");
						//session.setAttribute("Destination", arrival);
						String ticketClass = request.getParameter("Class");
						//session.setAttribute("Class",ticketClass);
						int seatnum = Integer.parseInt(request.getParameter("seat_number"));
						//session.setAttribute("seat_number", seatnum);
						String type = request.getParameter("Type");
						//session.setAttribute("Type",type);
						String discount = request.getParameter("Discount");
						//session.setAttribute("Discount",discount);
						String representative = request.getParameter("Representative");
						//session.setAttribute("Representative",representative);
						String transit_line = request.getParameter("Transit_line");
						int ssn =0;
						boolean assist = false;
						if(!representative.equals("None")){
							

							int idx = Tools.findUsername(representative);
							String[] splited = representative.split(" ");
							String repFirstName = splited[0];
							String repLastName = splited[1];
							String temp = splited[3];
							String cpusername = representative.substring(idx,representative.length()-1);
							String cpusernameSQL = "SELECT SSN FROM TrainTicketing.Employee where First_name='"+repFirstName+"'and last_name='"+repLastName+"' and username='"+cpusername+"';";
							ResultSet rep = stmt.executeQuery(cpusernameSQL);
							rep.next();
							ssn = rep.getInt("SSN");
							rep.close();
							assist = true;
						}
						double booking_fee = 1.0;
						/* PreparedStatement ps = con.prepareStatement(Tools.big_query);
						ps.setString(1, depart.split("-")[0]);
						ps.setString(2, arrival.split("-")[0]);
						ResultSet reservation = ps.executeQuery(); */
						Timestamp today = new Timestamp(System.currentTimeMillis());	
						String findOrigin = "SELECT station_ID FROM TrainTicketing.Station WHERE city='"+depart.split("-")[0]+"' and state='"+depart.split("-")[1]+"';";
						ResultSet originRS = stmt.executeQuery(findOrigin);
						int dep_station_id=0;
						if(originRS.next()){
							dep_station_id = originRS.getInt(1);
						}
						originRS.close();
						
						String findDestination = "SELECT station_ID FROM TrainTicketing.Station WHERE city='"+arrival.split("-")[0]+"' and state='"+arrival.split("-")[1]+"';";
						ResultSet destRS = stmt.executeQuery(findDestination);
						int arr_station_id = 0;
						if(destRS.next()){
							arr_station_id = destRS.getInt(1);
						}
						destRS.close();
						
						if(dep_station_id == arr_station_id){
							response.sendRedirect("ReservationFail.jsp");
							return;
						}
						
						ResultSet checkTransitLine = stmt.executeQuery("select transit_line_name, train_ID from TrainTicketing.Stop where station_ID="+dep_station_id+" and transit_line_name = '"+transit_line+"' and transit_line_name in (select transit_line_name from TrainTicketing.Stop where station_ID="+arr_station_id+" and transit_line_name ='"+ transit_line+"')");
						if(!checkTransitLine.next()){
							
							checkTransitLine.close();
							response.sendRedirect("ReservationFail.jsp");
							return;
						}
						
						
						int train_id = checkTransitLine.getInt(2);
						checkTransitLine.close();
						
						Date origin_date = Date.valueOf(request.getParameter("Date"));
						/* ResultSet dest_rs = stmt.executeQuery("SELECT arrival_time from TrainTicketing.Stop where station_ID ="+destination_id+";");
						dest_rs.next(); */
						Date destination_date = Date.valueOf(request.getParameter("Date"));
						//out.print(reservation.getString(2));
						//reservation.close();
						if(ticketClass.equals("Economy")){
							ResultSet econFare = stmt.executeQuery("SELECT * FROM TrainTicketing.Economy_fare where transit_line_name ='"+transit_line+"';");
							econFare.next();
							 if(type.equals("One Way")){
								 fare = econFare.getFloat("one_way_fee");
							 }else if(type.equals("Round Trip")){
								 fare = econFare.getFloat("round_trip_fee");
							 }else if(type.equals("Monthly Pass")){
								 fare = econFare.getFloat("monthly_fee");
							 }else{
								fare = econFare.getFloat("weekly_fee"); 
							 }
							 econFare.close();
						}else if(ticketClass.equals("Business")){
							ResultSet bussFare = stmt.executeQuery("SELECT * FROM TrainTicketing.Business_fare where transit_line_name ='"+transit_line+"';");
							bussFare.next();
							 if(type.equals("One Way")){
								 fare = bussFare.getFloat(4);
							 }else if(type.equals("Round Trip")){
								 fare = bussFare.getFloat(5);
							 }else if(type.equals("Monthly Pass")){
								 fare = bussFare.getFloat(2);
							 }else{
								fare = bussFare.getFloat(3); 
							 }
							 bussFare.close();
						}else{
							ResultSet firstFare = stmt.executeQuery("SELECT * FROM TrainTicketing.First_fare where transit_line_name ='"+transit_line+"';");
							firstFare.next();
							if(type.equals("One Way")){
								 fare = firstFare.getFloat(4);
							 }else if(type.equals("Round Trip")){
								 fare = firstFare.getFloat(5);
							 }else if(type.equals("Monthly Pass")){
								 fare = firstFare.getFloat(2);
							 }else{
								fare = firstFare.getFloat(3); 
							 }
							firstFare.close();
						}
						ResultSet discountRs = stmt.executeQuery("SELECT * FROM TrainTicketing.Fare where transit_line_name ='"+transit_line+"';");
						discountRs.next();
						if(discount.equals("Senior")){
							discountNum = discountRs.getFloat(2);
						}else if(discount.equals("Children")){
							discountNum = discountRs.getFloat(3);
						}else if(discount.equals("Disabled")){
							discountNum = discountRs.getFloat(4);
						}
						discountRs.close();
						
						String findAvailable = "SELECT available_number_of_seats FROM TrainTicketing.Train_schedule WHERE train_ID="+train_id+" and transit_line_name='"+transit_line+"';";
						ResultSet findAva = stmt.executeQuery(findAvailable);
						int available = 0;
						if(findAva.next()){
							available = findAva.getInt(1);
						}
						findAva.close();
						
						String reserved = "SELECT sum(seat_number) FROM TrainTicketing.Reservation WHERE dep_Train_ID="+train_id+" and dep_date=?";
						PreparedStatement pstmt2 = con.prepareStatement(reserved);
						pstmt2.setDate(1,origin_date);
						ResultSet reservedRS = pstmt2.executeQuery();
						int reservedSeat = 0;
						if(reservedRS.next()){
							reservedSeat = reservedRS.getInt(1);
						}
						reservedRS.close();
						
						if(seatnum+ reservedSeat > available){
							out.print("You can reserve at most "+(available - reservedSeat)+ " seats.");
							stmt.close();
							con.close();
							return;
						}
						
						total_fare = fare*discountNum*seatnum+booking_fee;
						String sql;
						if(assist){
							sql = "INSERT INTO TrainTicketing.Reservation(total_fare,seat_number, class, booking_fee, reservation_date,dep_Train_ID, dep_Transit_line_name, dep_Station_ID, dep_Date, arr_Train_ID,arr_Transit_line_name, arr_Station_ID, arr_date, assist_representative_SSN, customer_Username, type, discount) values ("+total_fare+","+seatnum+",'"+ticketClass+"',"+booking_fee+","+"?,"+train_id+",'"+transit_line+"',"+dep_station_id+","+"?,"+train_id+",'"+transit_line+"',"+arr_station_id+","+"?,"+ssn+",'"+username_str+"','"+type+"','"+discount+"'"+");";
						}else{
							sql = "INSERT INTO TrainTicketing.Reservation(total_fare,seat_number, class, booking_fee, reservation_date,dep_Train_ID, dep_Transit_line_name, dep_Station_ID, dep_Date, arr_Train_ID,arr_Transit_line_name, arr_Station_ID, arr_date,customer_Username, type, discount) values ("+total_fare+","+seatnum+",'"+ticketClass+"',"+booking_fee+","+"?,"+train_id+",'"+transit_line+"',"+dep_station_id+","+"?,"+train_id+",'"+transit_line+"',"+arr_station_id+","+"?"+",'"+username_str+"','"+type+"','"+discount+"'"+");";
						}
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setTimestamp(1,today);
						pstmt.setDate(2,origin_date);
						pstmt.setDate(3,destination_date);
						pstmt.executeUpdate();
						//String insertQuery="INSERT INTO TrainTicketing.Reservation(total_fare,seat_number, class, booking_fee, reservation_date,dep_Train_ID, dep_Transit_line_name, dep_Station_ID, dep_Date, arr_Transit_line_name, arr_Station_ID, arr_date, assist_representative_SSN, customer_Username) values ("+total_fare+","+seatnum+",'"+ticketClass+"',"+booking_fee+","+today+"',"+train_id+",'"+train_line_name+"',"+origin_id+",'"+origin_date+"',"+train_id+",'"+train_line_name+"',"+destination_id+",'"+destination_date+"',"+ssn+",'"+username_str+"');";
						
						
						response.sendRedirect("SuccessfulReservation.jsp");
						
						
						/* String findSeat = "SELECT available_number_of_seats FROM TrainTicketing.Train_schedule WHERE train_ID="+train_id+";";
						ResultSet oldSeat = stmt.executeQuery(findSeat);
						oldSeat.next();
						int oldSeatNum = oldSeat.getInt(1);
						int newSeatNum = oldSeatNum - seatnum;
						oldSeat.close();
						if(newSeatNum < 0){
							out.print("I can reserve at most "+oldSeatNum+ " seats.");
							stmt.close();
							con.close();
							return;
						}else{
							String updateSeat = "UPDATE TrainTicketing.Train_schedule SET available_number_of_seats="+newSeatNum+" WHERE train_ID ="+train_id+";";
							//int insert = stmt.executeUpdate(insertQuery);
							int update = stmt.executeUpdate(updateSeat);
							stmt.close();
							con.close();
							response.sendRedirect("SuccessfulReservation.jsp");
						} */
						
						
				
						
						
					/* }else{
						out.print("login failed");
					} */
					
				}else{
					out.print("Invalid user type, please log in with proper type.");
					response.sendRedirect("Login.jsp");
					return;
				}
				
			
	%>
<!-- <a href="Login.jsp">back to login</a> -->
</body>
</html>