<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/jsp/include/headlogo.jsp"%>
<%@include file="/WEB-INF/jsp/include/header.jsp"%>
<%@include file="/WEB-INF/jsp/include/menu.jsp"%>
<title><spring:message code="BzComposer.purchaseorderboardtitle"/></title>

</head>
<body>
<!-- begin shared/header -->
<div class="wrapper fix" style="
                             background-color: #E0E0E0;
                             font-family: 'Yantramanav', sans-serif;
                             color: #495057;
                             margin: 0px;
                         ">
      <div class="top_header_part fix">
                  <div class="header_part_left_left fix">
                     <div class="fix outlet_holder">
                        <div class="fix outlet_holder_moving">
                           <p class="marquee">Umma's K-BBQ</p>
                        </div>
                     </div>
                  </div>
                  <div class="header_part_left fix">
                     <button id="open_hold_sales" data-bs-toggle="modal" data-bs-target="#show_sale_hold_modal" onclick="openHoldSales()" style="padding:0px 10px;"><i class="fas fa-folder-open"></i> Open Hold Sales</button>
                     <form action="https://posmaxx.com/administrator/Authentication/setlanguage" method="POST" style="display: inline-block;width: 20%;">
                        <select tabindex="2" class="form-control select2" name="language" style="width: 100%;" onchange='this.form.submit()'>
                           <option value="english"
                              selected>English</option>
                           <option value="spanish"
                              >Spanish</option>                     
                           <option value="french"
                              >French</option>
                           <option value="arabic"
                              >Arabic</option>
                        </select>
                     </form>
                     <button id="help_button" style="padding:0px 10px;background-color: #dc3545 !important; color: white;" onclick="helpModalOpen()"><i class="fas fa-question-circle"></i> Read Before Begin</button>
                     <button id="calculator_button" style="margin-right: 3px;padding:0px 10px"><i class="fas fa-calculator"></i> Calculator</button>
                     <!-- <button id="kitchen_waiter_bar_button" style="    padding: 0px 10px;margin: 0px;"><i class="fas fa-directions"></i> Kitchen, Waiter & Bar</button> -->
                     <!-- <button id="keyboard_shortcuts_button"><i class="fas fa-keyboard"></i> Keyboard Shortcuts</button> -->
                  </div>
                  <div class="header_part_right fix">
                     <div class="header_single_button_holder" style="width:19%">
                        <button style="float:left;" id="last_ten_sales_button" data-bs-target="#show_last_ten_sales_modal" onclick="lastTenSales()"><i class="fas fa-history"></i> Last 10 Sales</button>
                     </div>
                     <div style="text-align:center;width:28%" class="header_single_button_holder">
                        <button id="notification_button" data-bs-toggle="modal" data-bs-target="#notification_list_modal" onclick="notifactionList()"><i class="fas fa-bell"></i> Kitchen Notification (<span id="notification_counter">0</span>)</button>
                     </div>
                     <div class="header_single_button_holder" style="width:20%;">
                        <a href="#" id="register_close"><button style="float:right;"><i class="fas fa-times"></i> Register</button></a>
                     </div>
                     <div class="header_single_button_holder" style="width:17%;">
                        <a href="#" id="go_to_dashboard"><button style="float:right;"><i class="fas fa-caret-square-left"></i> Back</button></a>
                     </div>
                     <div class="header_single_button_holder" style="width:15.8%">
                        <a href="https://posmaxx.com/administrator/Authentication/logOut"><button style="float:right;"><i class="fas fa-sign-out-alt"></i> Logout</button></a>
                     </div>
                  </div>
               </div>
               <div id="main_part fix">
                  <div class="main_left fix" style="height: 800px;">
                     <div class="holder fix">
                        <div id="running_order_header">
                           <h3>Running Orders</h3>
                           <span id="refresh_order"><i class="fas fa-sync-alt"></i></span>
                           <input type="text" name="search_running_orders" id="search_running_orders" style="height: 15px;    margin: 0px 0px 0px 5px;width: 90%;" placeholder="Table, Order Number, Waiter, Customer" />
                        </div>
                        <div class="order_details fix" id="order_details_holder">
                           <div data-started-cooking="0" data-done-cooking="0" class="single_order fix" style="margin-top:0px" data-selected="unselected" id="order_1">
                              <div class="inside_single_order_container fix">
                                 <div class="single_order_content_holder_inside fix">
                                    <span id="open_orders_order_status_1" style="display:none;">1</span>
                                    <p style="font-size: 16px;text-align: left;width: 125px;float: left;">Order: <span class="running_order_order_number">A 000001</span></p>
                                    <img src="https://posmaxx.com/administrator/assets/images/right-arrow.png" style="float: right;width: 13px;margin: 2px;transition: .25s ease-out;" class="running_order_right_arrow" id="running_order_right_arrow_1">
                                    <p>Table: <span class="running_order_table_name">Family Table</span></p>
                                    <p>Waiter: <span class="running_order_waiter_name">Raj Mondal</span></p>
                                    <p>Customer: <span class="running_order_customer_name">Walk-in Customer</span></p>
                                 </div>
                                 <div class="order_condition">
                                    <p class="order_on_processing">Started Cooking: 0/3</p>
                                    <p class="order_done">Done: 0/3</p>
                                 </div>
                                 <div class="order_condition">
                                    <p style="font-size:16px;">Time Count: <span id="order_minute_count_1">27795</span>:<span id="order_second_count_1">58</span> M</p>
                                 </div>
                              </div>
                           </div>
                           <div data-started-cooking="3" data-done-cooking="0" class="single_order fix" data-selected="unselected" id="order_2">
                              <div class="inside_single_order_container fix">
                                 <div class="single_order_content_holder_inside fix">
                                    <span id="open_orders_order_status_2" style="display:none;">1</span>
                                    <p style="font-size: 16px;text-align: left;width: 125px;float: left;">Order: <span class="running_order_order_number">A 000002</span></p>
                                    <img src="https://posmaxx.com/administrator/assets/images/right-arrow.png" style="float: right;width: 13px;margin: 2px;transition: .25s ease-out;" class="running_order_right_arrow" id="running_order_right_arrow_2">
                                    <p>Table: <span class="running_order_table_name">None</span></p>
                                    <p>Waiter: <span class="running_order_waiter_name"></span></p>
                                    <p>Customer: <span class="running_order_customer_name">Biswa Nath</span></p>
                                 </div>
                                 <div class="order_condition">
                                    <p class="order_on_processing">Started Cooking: 3/3</p>
                                    <p class="order_done">Done: 0/3</p>
                                 </div>
                                 <div class="order_condition">
                                    <p style="font-size:16px;">Time Count: <span id="order_minute_count_2">27783</span>:<span id="order_second_count_2">42</span> M</p>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div style="position: absolute;bottom: 5px;width:100%;" id="left_side_button_holder_absolute">
                           <button class="operation_button fix" id="modify_order"><i class="fas fa-edit"></i> Modify Order/Add Item/Change Table</button>
                           <button class="operation_button fix" id="single_order_details"><i class="fas fa-info-circle"></i> Order Details</button>
                           <button class="operation_button fix" id="print_kot"><i class="fas fa-print"></i> Print KOT</button>
                           <button class="operation_button fix" id="create_invoice_and_close"><i class="fas fa-file-invoice"></i> Create Invoice & Close</button>
                           <button class="operation_button fix" id="cancel_order_button"><i class="fas fa-ban"></i> Cancel Order</button>
                           <button class="operation_button fix" id="kitchen_status_button"><i class="fas fa-spinner"></i> Kitchen Status</button>
                        </div>
                     </div>
                  </div>
                  <div class="main_middle fix" style="height: 800px;">
                     <div class="main_top fix">
                        <div class="button_holder fix">
                           <div class="single_button_middle_holder fix">
                              <button data-selected="unselected" style="float:left;margin-left:2px;" data-bs-target="#show_tables_modal2" onclick="myFunction()" id="dine_in_button"><i class="fas fa-table"></i> Dine In</button>
                           </div>
                           <div style="text-align:center;" class="single_button_middle_holder fix">
                              <button id="take_away_button"><i class="fas fa-shopping-bag"></i> Take Away</button>
                           </div>
                           <div class="single_button_middle_holder fix">
                              <button data-selected="unselected" style="float:right;margin-right:2px;" id="delivery_button"><i class="fas fa-truck"></i> Delivery</button>
                           </div>
                        </div>
                        <div class="waiter_customer">
                           <div class="single_button_middle_holder" style="padding-left:.4%;width:32.9%">
                              <select style="width:92%;margin-left:2px;" id="select_waiter" class="select2">
                                 <option value="">Waiter</option>
                                 <option value="2">Raj Mondal</option>
                              </select>
                           </div>
                           <div class="single_button_middle_holder">
                              <div style="width:92%;margin:0 auto;">
                                 <select id="walk_in_customer" id="select_walk_in_customer" class="select2">
                                    <option value="">Customer</option>
                                    <option value="1" >Walk-in Customer </option>
                                    <option value="2" >Walkin 033</option>
                                 </select>
                                 <i class="fas fa-pencil-alt" id="edit_customer" style="cursor:pointer;"></i>
                                 <button id="plus_button" data-bs-toggle="modal" data-bs-target="#add_customer_modal" onclick="plusButton()"><i class="fas fa-plus-square"></i></button>
                              </div>
                           </div>
                           <div class="single_button_middle_holder">
                              <button id="table_button" data-bs-toggle="modal" data-bs-target="#show_tables_modal2" onclick="myFunction()"><i class="fas fa-table"></i> Table</button>
                           </div>
                        </div>
                        <!-- <select>
                           <option>Table</option>
                           </select> -->
                     </div>
                     <div class="main_center fix">
                        <div class="order_table_holder fix">
                           <div class="order_table_header_row fix">
                              <div class="single_header_column fix" id="single_order_item">Item</div>
                              <div class="single_header_column fix" id="single_order_price">Price</div>
                              <div class="single_header_column fix" id="single_order_qty">Qty</div>
                              <div class="single_header_column fix" id="single_order_discount">Discount</div>
                              <div class="single_header_column" id="single_order_total">Total</div>
                           </div>
                           <div class="order_holder fix">
                           </div>
                        </div>
                     </div>
                     <div style="position: absolute;bottom: 1px;width: 100%" id="bottom_absolute">
                        <table cellspacing="0" cellpadding="0">
                           <tr style="background-color: #ffffff">
                              <th style="width:50%;text-align:left;padding-left:10px">&nbsp;</th>
                              <th style="width:10%;">&nbsp;</th>
                              <th style="width:15%;">&nbsp;</th>
                              <th style="width:10%;">&nbsp;</th>
                              <th style="width:15%;text-align:right;padding-right:10px;">&nbsp;</th>
                           </tr>
                           <tr style="background-color:#F5F5F5;">
                              <td style="padding-left:10px;font-weight:bold;text-align:left;">Total Item: <span id="total_items_in_cart_with_quantity">0</span> <span id="total_items_in_cart" style="display: none;">0</span></td>
                              <td style="font-weight:bold;text-align:right;" colspan="3">Sub Total</td>
                              <td style="font-weight:bold;text-align:right;padding-right:10px;">$ <span id="sub_total_show">0.00</span><span id="sub_total" style="display:none;">0.00</span>
                                 <span id="total_item_discount" style="display:none">0</span><span id="discounted_sub_total_amount" style="display:none;">0.00</span>
                              </td>
                           </tr>
                           <tr style="background-color:#F5F5F5;">
                              <td></td>
                              <td style="font-weight:bold;text-align:right;" colspan="3">Discount</td>
                              <td style="text-align:right;padding-right:10px;"><input type="text" name="" class="special_textbox" placeholder="Amt or %" id="sub_total_discount"/><span style="display:none" id="sub_total_discount_amount"></span></td>
                           </tr>
                           <tr style="background-color:#F5F5F5;">
                              <!-- <td></td>
                                 <td style="font-weight:bold;text-align:right;" colspan="3">VAT</td>
                                 <td style="font-weight:bold;text-align:right;padding-right:10px;">$ <span id="all_items_vat">0.00</span></td> -->
                              <td style="font-weight:bold;text-align:right;padding-right:10px;" colspan="5"><span id="all_items_vat" style="display: block;overflow: auto;height: 35px;"></span></td>
                           </tr>
                           <tr style="background-color:#F5F5F5;">
                              <td></td>
                              <td style="font-weight:bold;text-align:right;" colspan="3">Total Discount</td>
                              <td style="font-weight:bold;text-align:right;padding-right:10px;">$ <span id="all_items_discount">0.00</span></td>
                           </tr>
                           <tr style="background-color:#F5F5F5;">
                              <td></td>
                              <td style="font-weight:bold;text-align:right;" colspan="3">Service/Delivery Charge</td>
                              <td style="text-align:right;padding-right:10px;"><input type="" name=""  class="special_textbox" placeholder="Amt" id="delivery_charge"/></td>
                           </tr>
                           <tr style="background-color: #D5E5F5;height: 35px;">
                              <td></td>
                              <td style="font-weight:bold;text-align:right;" colspan="3">Total Payable</td>
                              <td style="font-weight:bold;text-align:right;padding-right:10px;">$ <span id="total_payable">0.00</span></td>
                           </tr>
                        </table>
                        <div class="main_bottom fix" style="padding-top:2px;">
                           <div class="button_group fix">
                              <div class="single_button_middle_holder cart_bottom_buttons" style="width:17%;">
                                 <button style="float:left;padding:0px 3px;" id="cancel_button"><i class="fas fa-times"></i> Cancel</button>
                              </div>
                              <div style="text-align:center;width:20%;" class="single_button_middle_holder cart_bottom_buttons">
                                 <button id="hold_sale" style="padding:0px 3px;"><i class="fas fa-hand-rock"></i></i> Hold</button>
                              </div>
                              <div class="single_button_middle_holder cart_bottom_buttons" style="width:28%;">
                                 <button style="float:right;margin-right:2px;padding:0px 3px;" id="direct_invoice"><i class="fas fa-file-invoice"></i> <span id="place_edit_order_direct_invoice">Direct Invoice</span></button>
                              </div>
                              <div class="single_button_middle_holder cart_bottom_buttons" style="width:34%;">
                                 <button style="float:right;margin-right:2px;padding:0px 3px;" id="place_order_operation"><i class="fas fa-utensils"></i> <span id="place_edit_order">Place Order</span></button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="main_right fix" style="height: 800px;">
                     <input type="text" name="search" id="search" placeholder="Name or Code or Category or VEG or BEV or BAR" />
                     <div class="select_category fix">
                        <button class="category_next_prev" id="previous_category"><i class="fas fa-angle-left"></i></i></button>
                        <div class="select_category_inside">
                           <div class="select_category_inside_inside">
                              <button class="category_button" id="button_category_show_all" style="border-left: solid 2px #DEDEDE;">All</button><button class="category_button" id="button_category_1">Main Dishes</button><button class="category_button" id="button_category_2">Bowls</button><button class="category_button" id="button_category_3">Additional Items</button><button class="category_button" id="button_category_4">Family Packs</button><button class="category_button" id="button_category_5">Drinks</button>
                           </div>
                        </div>
                        <button class="category_next_prev" id="next_category"><i class="fas fa-angle-right"></i></button>
                     </div>
                     <div style="position:relative;" id="main_item_holder">
                        <div style="position:absolute;bottom:0px;width:100%" id="secondary_item_holder">
                           <div class="category_items fix">
                              <div id="category_1" class="specific_category_items_holder">
                                 <div class="single_item fix" id="item_1">
                                    <p class="item_price">$ <span id="price_1">17.95</span></p>
                                    <img src="https://posmaxx.com/administrator/assets/POS/images/1d61a4fbd3b4f0dedb13f4c897972bc6.jpg" alt="" width="142">
                                    <p class="item_name">Kal-BI Plate (001)</p>
                                 </div>
                                 <div class="single_item fix" id="item_2">
                                    <p class="item_price">$ <span id="price_2">13.95</span></p>
                                    <img src="https://posmaxx.com/administrator/assets/POS/images/d2f5759f5c4db49b88372d1a9b772bd6.jpg" alt="" width="142">
                                    <p class="item_name">BBQ Chicken Plate (002)</p>
                                 </div>
                                 <div class="single_item fix" id="item_3">
                                    <p class="item_price">$ <span id="price_3">14.95</span></p>
                                    <img src="https://posmaxx.com/administrator/assets/POS/images/d8af2e1107000d7f7c6e762769d5e4b4.jpg" alt="" width="142">
                                    <p class="item_name">Bi Bim Bap (003)</p>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- The Modal -->
               <div id="item_modal" class="modal">
                  <!-- Modal content -->
                  <div class="modal-content">
                     <span id="modal_item_row" style="display:none">0</span>
                     <span id="modal_item_id" style="display:none"></span>
                     <span id="modal_item_price" style="display:none"></span>
                     <span id="modal_item_vat_percentage" style="display:none"></span>
                     <h1 id="modal_item_name">Item Name</h1>
                     <div class="section1 fix">
                        <div class="sec1_inside" id="sec1_1">Quantity</div>
                        <div class="sec1_inside" id="sec1_2"><i class="fas fa-minus-circle" id="decrease_item_modal"></i> <span id="item_quantity_modal">1</span> <i class="fas fa-plus-circle" id="increase_item_modal"></i></div>
                        <div class="sec1_inside" id="sec1_3">$ <span id="modal_item_price_variable" style="display:none;">0</span><span id="modal_item_price_variable_without_discount">0</span><span id="modal_discount_amount" style="display:none;">0</span></div>
                     </div>
                     <div class="section2 fix">
                        <div class="sec2_inside" id="sec2_1">Modifiers</div>
                        <div class="sec2_inside" id="sec2_2">$ <span id="modal_modifier_price_variable">0</span><span id="modal_modifiers_unit_price_variable" style="display: none;">0</span></div>
                     </div>
                     <div class="section3 fix">
                        <div class="modal_modifiers">
                           <p>Cool Haus 2</p>
                        </div>
                        <div class="modal_modifiers">
                           <p>First Scoo</p>
                        </div>
                        <div class="modal_modifiers">
                           <p>Mg</p>
                        </div>
                        <div class="modal_modifiers">
                           <p>Modifier</p>
                        </div>
                        <div class="modal_modifiers">
                           <p>Cool Haus 2</p>
                        </div>
                        <div class="modal_modifiers">
                           <p>First Scoo 2</p>
                        </div>
                        <div class="modal_modifiers">
                           <p></p>
                        </div>
                        <div class="modal_modifiers">
                           <p>Modifier</p>
                        </div>
                     </div>
                     <div id="modal_discount_section">
                        <p style="float: left;margin: 0px 0px 0px 2px;font-size: 19px;">Discount</p>
                        <input type="text" name="" id="modal_discount" placeholder="Amt or %"/>
                     </div>
                     <div class="section4 fix">Total&nbsp;&nbsp;&nbsp;$ <span id="modal_total_price">0</span></div>
                     <div class="section5 fix">Note</div>
                     <div class="section6 fix">
                        <textarea name="item_note" id="modal_item_note" maxlength="50"></textarea>
                     </div>
                     <div class="section7 fix">
                        <div class="sec7_inside" id="sec7_1"><button id="close_item_modal">Cancel</button></div>
                        <div class="sec7_inside" id="sec7_2"><button id="add_to_cart">Add to Cart</button></div>
                     </div>
                     <!-- <span class="close">&times;</span> -->
                     <!-- <p>Some text in the Modal..</p> -->
                  </div>
               </div>
               <!-- end of item modal -->
               <!--add customer modal -->
               <!-- The Modal -->
               <div id="add_customer_modal" class="modal" style="padding-top:20px;">
                  <!-- Modal content -->
                  <div class="modal-content">
                     <h1>Add Customer</h1>
                     <div class="customer_add_modal_info_holder">
                        <input type="hidden" id="customer_id_modal" value="">
                        <div class="customer_section fix">
                           <p class="input_level">Name <span style="color:red;">*</span></p>
                           <input type="text" class="add_customer_modal_input" id="customer_name_modal" required>
                        </div>
                        <div class="customer_section fix">
                           <p class="input_level">Phone <span style="color:red;">*</span></p>
                           <small>Should have country code</small>
                           <input type="text" class="add_customer_modal_input" id="customer_phone_modal" required>
                        </div>
                        <div class="customer_section fix">
                           <p class="input_level">Email</p>
                           <input type="email" class="add_customer_modal_input" id="customer_email_modal">
                        </div>
                        <div class="customer_section fix">
                           <p class="input_level">DOB</p>
                           <input type="datable" class="add_customer_modal_input" id="customer_dob_modal" data-datable="yyyymmdd"  data-datable-divider=" - ">
                        </div>
                        <div class="customer_section fix">
                           <p class="input_level">DOA</p>
                           <input type="datable" class="add_customer_modal_input" id="customer_doa_modal" data-datable="yyyymmdd"  data-datable-divider=" - ">
                        </div>
                        <div class="customer_section fix">
                           <p class="input_level">Delivery Address</p>
                           <textarea id="customer_delivery_address_modal"></textarea>
                        </div>
                     </div>
                     <div class="section7 fix">
                        <div class="sec7_inside" id="sec7_1"><button id="close_add_customer_modal">Cancel</button></div>
                        <div class="sec7_inside" id="sec7_2"><button id="add_customer">Add Customer</button></div>
                     </div>
                     <!-- <span class="close">&times;</span> -->
                     <!-- <p>Some text in the Modal..</p> -->
                  </div>
               </div>
               <div id="show_tables_modal2" class="modal modal-lg" >
                  <!-- Modal content -->
                  <div class="modal-content" id="modal_content_show_tables2">
                     <h1>Tables</h1>
                     <p id="new_or_order_number_table">Order Number: <span id="order_number_or_new_text">New</span></p>
                     <div class="select_table_modal_info_holder2 fix">
                        <div class="floatleft fix single_order_table" id="single_table_info_holder_1">
                           <p class="table_name" style="font-weight:bold;"><span id="sit_name_1">T001<span></p>
                           <p class="table_sit_capacity">Sit Capacity: <span id="sit_capacity_number_1">4<span></p>
                           <p class="table_available">Available: <span id="sit_available_number_1">4</span></p>
                           <img class="table_image" src="https://posmaxx.com/administrator/assets/images/table_icon2.png" alt="">
                           <p class="running_order_in_table">Running orders in table</p>
                           <div class="single_table_order_details_holder fix" id="single_table_order_details_holder_1">
                              <div class="top fix" id="single_table_order_details_top_1">
                                 <div class="single_row header fix">
                                    <div class="floatleft fix column first_column">Ord.</div>
                                    <div class="floatleft fix column second_column">Time</div>
                                    <div class="floatleft fix column third_column">Person</div>
                                    <div class="floatleft fix column forth_column">Del</div>
                                 </div>
                              </div>
                              <div class="bottom fix" id="single_table_order_details_bottom_1"><input type="text" name="" placeholder="Order" class="floatleft bottom_order"  id="single_table_order_details_bottom_order_1" readonly><input type="text" name="" placeholder="Person" class="floatleft bottom_person" id="single_table_order_details_bottom_person_1"><button class="floatleft bottom_add" id="single_table_order_details_bottom_add_1">Add</button></div>
                           </div>
                        </div>
                        <div class="floatleft fix single_order_table" id="single_table_info_holder_2">
                           <p class="table_name" style="font-weight:bold;"><span id="sit_name_2">Family Table<span></p>
                           <p class="table_sit_capacity">Sit Capacity: <span id="sit_capacity_number_2">6<span></p>
                           <p class="table_available">Available: <span id="sit_available_number_2">6</span></p>
                           <img class="table_image" src="https://posmaxx.com/administrator/assets/images/table_icon2.png" alt="">
                           <p class="running_order_in_table">Running orders in table</p>
                           <div class="single_table_order_details_holder fix" id="single_table_order_details_holder_2">
                              <div class="top fix" id="single_table_order_details_top_2">
                                 <div class="single_row header fix">
                                    <div class="floatleft fix column first_column">Ord.</div>
                                    <div class="floatleft fix column second_column">Time</div>
                                    <div class="floatleft fix column third_column">Person</div>
                                    <div class="floatleft fix column forth_column">Del</div>
                                 </div>
                                 <div class="single_row fix">
                                    <div class="floatleft fix column first_column">1</div>
                                    <div class="floatleft fix column second_column">2022-07-09 20:11:00</div>
                                    <div class="floatleft fix column third_column">6</div>
                                    <div class="floatleft fix column forth_column"><i class="fas fa-trash-alt remove_table_order" id="remove_table_order_1"></i></div>
                                 </div>
                              </div>
                              <div class="bottom fix" id="single_table_order_details_bottom_2"><input type="text" name="" placeholder="Order" class="floatleft bottom_order"  id="single_table_order_details_bottom_order_2" readonly><input type="text" name="" placeholder="Person" class="floatleft bottom_person" id="single_table_order_details_bottom_person_2"><button class="floatleft bottom_add" id="single_table_order_details_bottom_add_2">Add</button></div>
                           </div>
                        </div>
                     </div>
                     <div class="fix bottom_button_holder_table_modal">
                        <div class="left fix floatleft half">
                           <button id="please_read_table_modal_button"><i class="fas fa-question-circle"></i> Please Read</button>
                        </div>
                        <div class="right fix floatleft half">
                           <button class="floatright" id="submit_table_modal">Submit</button>
                           <button class="floatright" id="proceed_without_table_button">Proceed without Table</button>
                           <button class="floatright" id="table_modal_cancel_button">Cancel</button>
                        </div>
                     </div>
                     <!-- <span class="close">&times;</span> -->
                     <!-- <p>Some text in the Modal..</p> -->
                  </div>
               </div>
               <!-- end add customer modal -->
               <!-- The sale hold modal -->
               <div id="show_sale_hold_modal" class="modal">
                  <!-- Modal content -->
                  <div class="modal-content" id="modal_content_hold_sales">
                     <p class="cross_button_to_close" id="hold_sales_close_button_cross">&times;</p>
                     <!-- <img id="hold_sales_close_button_cross" class="close_button" src="https://posmaxx.com/administrator/assets/images/close_icon.png"> -->
                     <div class="hold_sale_modal_info_holder fix">
                        <h1 class="main_header fix">Hold Sale</h1>
                        <div class="detail_hold_sale_holder fix">
                           <div class="hold_sale_left fix">
                              <div class="hold_list_holder fix">
                                 <div class="header_row fix">
                                    <div class="first_column column fix">Hold Number</div>
                                    <div class="second_column column fix">Customer</div>
                                    <div class="third_column column fix">Table</div>
                                 </div>
                                 <div class="detail_holder fix">
                                    <div class="single_hold_sale fix">
                                       <div class="first_column column fix">09</div>
                                       <div class="second_column column fix"></div>
                                       <div class="third_column column fix">Table 8</div>
                                    </div>
                                    <div class="single_hold_sale fix">
                                       <div class="first_column column fix">08</div>
                                       <div class="second_column column fix">Walk-In-Customer</div>
                                       <div class="third_column column fix">Table 7</div>
                                    </div>
                                    <div class="single_hold_sale fix">
                                       <div class="first_column column fix">07</div>
                                       <div class="second_column column fix">Walk-In-Customer</div>
                                       <div class="third_column column fix">Table 7</div>
                                    </div>
                                 </div>
                                 <div class="delete_all_hold_sales_container fix">
                                    <button id="delete_all_hold_sales_button">Delete all Hold Sales</button>
                                 </div>
                              </div>
                           </div>
                           <div class="hold_sale_right fix">
                              <div class="top fix">
                                 <div class="top_middle fix">
                                    <h1>Order Details</h1>
                                    <div class="waiter_customer_table fix">
                                       <div class="fix order_type"><span style="font-weight: bold;">Order Type: </span><span id="hold_order_type"></span><span id="hold_order_type_id" style="display:none;"></span></div>
                                    </div>
                                    <div class="waiter_customer_table fix">
                                       <div class="waiter fix"><span style="font-weight: bold;">Waiter: </span><span style="display:none;" id="hold_waiter_id"></span><span id="hold_waiter_name"></span></div>
                                       <div class="customer fix"><span style="font-weight: bold;">Customer: </span><span style="display:none;" id="hold_customer_id"></span><span id="hold_customer_name"></span></div>
                                       <div class="table fix"><span style="font-weight: bold;">Table: </span><span style="display:none;" id="hold_table_id"></span><span id="hold_table_name"></span></div>
                                    </div>
                                    <div class="item_modifier_details fix">
                                       <div class="modifier_item_header fix">
                                          <div class="first_column_header column_hold fix">Item</div>
                                          <div class="second_column_header column_hold fix">Price</div>
                                          <div class="third_column_header column_hold fix">Qty</div>
                                          <div class="forth_column_header column_hold fix">Discount</div>
                                          <div class="fifth_column_header column_hold fix">Total</div>
                                       </div>
                                       <div class="modifier_item_details_holder fix">
                                       </div>
                                       <div class="bottom_total_calculation_hold fix">
                                          <div class="single_row first fix">
                                             <div class="first_column fix">Total Item: <span id="total_items_in_cart_hold">0</span></div>
                                             <div class="second_column fix">Sub Total</div>
                                             <div class="third_column fix">$ <span id="sub_total_show_hold">0.00</span>
                                                <span id="sub_total_hold" style="display:none;">0.00</span>
                                                <span id="total_item_discount_hold" style="display:none;">0.00</span>
                                                <span id="discounted_sub_total_amount_hold" style="display:none;">0.00</span>
                                             </div>
                                          </div>
                                          <div class="single_row second fix">
                                             <div class="first_column fix">Discount</div>
                                             <div class="second_column fix"><span id="sub_total_discount_hold"></span><span id="sub_total_discount_amount_hold" style="display:none;">0.00</span></div>
                                          </div>
                                          <div class="single_row third fix">
                                             <!-- <div class="first_column fix">VAT</div> -->
                                             <div class="second_column fix"  colspan="5" style="width:100%;"><span id="all_items_vat_hold" style="display: block;overflow: auto;height: 40px;">0.00</span></div>
                                          </div>
                                          <div class="single_row forth fix">
                                             <div class="first_column fix">Total Discount</div>
                                             <div class="second_column fix">$ <span id="all_items_discount_hold">0.00</span></div>
                                          </div>
                                          <div class="single_row fifth fix">
                                             <div class="first_column fix">Service/Delivery Charge</div>
                                             <div class="second_column fix">$ <span id="delivery_charge_hold">0.00</span></div>
                                          </div>
                                          <div class="single_row sixth fix">
                                             <div class="first_column fix">Total Payable</div>
                                             <div class="second_column fix">$ <span id="total_payable_hold">0.00</span></div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="bottom">
                                 <div class="button_holder">
                                    <div class="single_button_holder">
                                       <button id="hold_sales_close_button">Cancel</button>
                                    </div>
                                    <div class="single_button_holder">
                                       <button id="hold_delete_button">delete</button>
                                    </div>
                                    <div class="single_button_holder">
                                       <button id="hold_edit_in_cart_button">Edit in Cart</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- end sale hold modal -->
               <!-- The sale hold modal -->
               <div id="show_last_ten_sales_modal" class="modal">
                  <!-- Modal content -->
                  <div class="modal-content" id="modal_content_last_ten_sales">
                     <p class="cross_button_to_close" id="last_ten_sales_close_button_cross">&times;</p>
                     <div class="last_ten_sales_modal_info_holder fix">
                        <h1 class="main_header fix">Last 10 Sales</h1>
                        <div class="last_ten_sales_holder fix">
                           <div class="hold_sale_left fix">
                              <div class="hold_list_holder fix">
                                 <div class="header_row fix">
                                    <div class="first_column column fix">Sale No</div>
                                    <div class="second_column column fix">Customer</div>
                                    <div class="third_column column fix">Table</div>
                                 </div>
                                 <div class="detail_holder fix">
                                    <div class="single_hold_sale fix">
                                       <div class="first_column column fix">09</div>
                                       <div class="second_column column fix">Walk-In-Customer</div>
                                       <div class="third_column column fix">Table 8</div>
                                    </div>
                                    <div class="single_hold_sale fix">
                                       <div class="first_column column fix">08</div>
                                       <div class="second_column column fix">Walk-In-Customer</div>
                                       <div class="third_column column fix">Table 7</div>
                                    </div>
                                    <div class="single_hold_sale fix">
                                       <div class="first_column column fix">07</div>
                                       <div class="second_column column fix">Walk-In-Customer</div>
                                       <div class="third_column column fix">Table 7</div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="hold_sale_right fix">
                              <div class="top fix">
                                 <div class="top_middle fix">
                                    <h1>Order Details</h1>
                                    <div class="waiter_customer_table fix">
                                       <div class="fix order_type">
                                          <span style="font-weight: bold;">Order Type: </span>
                                          <span id="last_10_order_type" style="width: 112px;display: inline-block;">&nbsp;</span>
                                          <span id="last_10_order_type_id" style="display:none;"></span>
                                          <span style="font-weight: bold;">Invoice No: </span>
                                          <span id="last_10_order_invoice_no"></span>
                                       </div>
                                    </div>
                                    <div class="waiter_customer_table fix">
                                       <div class="waiter fix"><span style="font-weight: bold;">Waiter: </span><span style="display:none;" id="last_10_waiter_id"></span><span id="last_10_waiter_name"></span></div>
                                       <div class="customer fix"><span style="font-weight: bold;">Customer: </span><span style="display:none;" id="last_10_customer_id"></span><span id="last_10_customer_name"></span></div>
                                       <div class="table fix"><span style="font-weight: bold;">Table: </span><span style="display:none;" id="last_10_table_id"></span><span id="last_10_table_name"></span></div>
                                    </div>
                                    <div class="item_modifier_details fix">
                                       <div class="modifier_item_header fix">
                                          <div class="first_column_header column_hold fix">Item</div>
                                          <div class="second_column_header column_hold fix">Price</div>
                                          <div class="third_column_header column_hold fix">Qty</div>
                                          <div class="forth_column_header column_hold fix">Discount</div>
                                          <div class="fifth_column_header column_hold fix">Total</div>
                                       </div>
                                       <div class="modifier_item_details_holder fix">
                                       </div>
                                       <div class="bottom_total_calculation_hold fix">
                                          <div class="single_row first fix">
                                             <div class="first_column fix">Total Item: <span id="total_items_in_cart_last_10">0</span></div>
                                             <div class="second_column fix">Sub Total</div>
                                             <div class="third_column fix">$ <span id="sub_total_show_last_10">0.00</span>
                                                <span id="sub_total_last_10" style="display:none;">0.00</span>
                                                <span id="total_item_discount_last_10" style="display:none;">0.00</span>
                                                <span id="discounted_sub_total_amount_last_10" style="display:none;">0.00</span>
                                             </div>
                                          </div>
                                          <div class="single_row second fix">
                                             <div class="first_column fix">Discount</div>
                                             <div class="second_column fix"><span id="sub_total_discount_last_10"></span><span id="sub_total_discount_amount_last_10" style="display:none;">0.00</span></div>
                                          </div>
                                          <div class="single_row third fix">
                                             <!-- <div class="first_column fix">VAT</div> -->
                                             <div class="second_column fix"  colspan="5" style="width:100%;"><span id="all_items_vat_last_10"style="display: block;overflow: auto;height: 40px;"></span></div>
                                          </div>
                                          <div class="single_row forth fix">
                                             <div class="first_column fix">Total Discount</div>
                                             <div class="second_column fix">$ <span id="all_items_discount_last_10">0.00</span></div>
                                          </div>
                                          <div class="single_row fifth fix">
                                             <div class="first_column fix">Service/Delivery Charge</div>
                                             <div class="second_column fix">$ <span id="delivery_charge_last_10">0.00</span></div>
                                          </div>
                                          <div class="single_row sixth fix">
                                             <div class="first_column fix">Total Payable</div>
                                             <div class="second_column fix">$ <span id="total_payable_last_10">0.00</span></div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                              <div class="bottom">
                                 <div class="button_holder">
                                    <div class="single_button_holder">
                                       <button id="last_ten_sales_close_button">Cancel</button>
                                    </div>
                                    <div class="single_button_holder">
                                       <button id="last_ten_delete_button">delete</button>
                                    </div>
                                    <div class="single_button_holder">
                                       <button id="last_ten_print_invoice_button">Print Invoice</button>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- end sale hold modal -->
               <!-- The sale hold modal -->
               <div id="generate_sale_hold_modal" class="modal">
                  <!-- Modal content -->
                  <div class="modal-content" id="modal_content_generate_hold_sales">
                     <h1>Hold</h1>
                     <div class="generate_hold_sale_modal_info_holder fix">
                        <p style="margin: 0px 0px 5px 0px;">Hold Number <span style="color:red;">*</span></p>
                        <input type="text" name="" id="hold_generate_input">
                     </div>
                     <div class="section7 fix">
                        <div class="sec7_inside" id="sec7_1"><button id="close_hold_modal">Cancel</button></div>
                        <div class="sec7_inside" id="sec7_2"><button id="hold_cart_info">Submit</button></div>
                     </div>
                  </div>
               </div>
               <!-- end add customer modal -->
               <!-- The order details modal -->
               <div id="order_detail_modal" class="modal">
                  <!-- Modal content -->
                  <div class="modal-content" id="modal_content_sale_details">
                     <div class="order_detail_modal_info_holder fix">
                        <div class="top fix">
                           <div class="top_middle fix">
                              <h1>Order Details</h1>
                              <div class="waiter_customer_table fix">
                                 <div class="fix order_type">
                                    <span style="font-weight: bold;">Order Type: </span>
                                    <span id="order_details_type" style="display: inline-block;width:118px;"></span>
                                    <span id="order_details_type_id" style="display:none;"></span>
                                    <span style="font-weight: bold;">Order Number: </span>
                                    <span id="order_details_order_number" style="display: inline-block;"></span>
                                 </div>
                              </div>
                              <div class="waiter_customer_table fix">
                                 <div class="waiter fix"><span style="font-weight: bold;">Waiter: </span><span style="display:none;" id="order_details_waiter_id"></span><span id="order_details_waiter_name"></span></div>
                                 <div class="customer fix"><span style="font-weight: bold;">Customer: </span><span style="display:none;" id="order_details_customer_id"></span><span id="order_details_customer_name"></span></div>
                                 <div class="table fix"><span style="font-weight: bold;">Table: </span><span style="display:none;" id="order_details_table_id"></span><span id="order_details_table_name"></span></div>
                              </div>
                              <div class="item_modifier_details fix">
                                 <div class="modifier_item_header fix">
                                    <div class="first_column_header column_hold fix">Item</div>
                                    <div class="second_column_header column_hold fix">Price</div>
                                    <div class="third_column_header column_hold fix">Qty</div>
                                    <div class="forth_column_header column_hold fix">Discount</div>
                                    <div class="fifth_column_header column_hold fix">Total</div>
                                 </div>
                                 <div class="modifier_item_details_holder fix">
                                 </div>
                                 <div class="bottom_total_calculation_hold fix">
                                    <div class="single_row first fix">
                                       <div class="first_column fix">Total Item: <span id="total_items_in_cart_order_details">0</span></div>
                                       <div class="second_column fix">Sub Total</div>
                                       <div class="third_column fix">$ <span id="sub_total_show_order_details">0.00</span>
                                          <span id="sub_total_order_details" style="display:none;">0.00</span>
                                          <span id="total_item_discount_order_details" style="display:none;">0.00</span>
                                          <span id="discounted_sub_total_amount_order_details" style="display:none;">0.00</span>
                                       </div>
                                    </div>
                                    <div class="single_row second fix">
                                       <div class="first_column fix">Discount</div>
                                       <div class="second_column fix"><span id="sub_total_discount_order_details"></span><span id="sub_total_discount_amount_order_details" style="display:none;">0.00</span></div>
                                    </div>
                                    <div class="single_row third fix">
                                       <!-- <div class="first_column fix">VAT</div> -->
                                       <div class="second_column fix"  colspan="5" style="width:100%;"><span id="all_items_vat_order_details"  style="display: block;overflow: auto;height: 40px;">0.00</span></div>
                                    </div>
                                    <div class="single_row forth fix">
                                       <div class="first_column fix">Total Discount</div>
                                       <div class="second_column fix">$ <span id="all_items_discount_order_details">0.00</span></div>
                                    </div>
                                    <div class="single_row fifth fix">
                                       <div class="first_column fix">Service/Delivery Charge</div>
                                       <div class="second_column fix"><span id="delivery_charge_order_details">0.00</span></div>
                                    </div>
                                    <div class="single_row sixth fix">
                                       <div class="first_column fix">Total Payable</div>
                                       <div class="second_column fix">$ <span id="total_payable_order_details">0.00</span></div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="create_invoice_close_order_in_order_details" id="order_details_post_invoice_buttons">
                           <button id="order_details_create_invoice_close_order_button"><i class="fas fa-file-invoice"></i> Create Invoice & Close</button>
                        </div>
                        <div class="create_invoice_close_order_in_order_details">
                           <button id="order_details_print_kot_button"><i class="fas fa-file-invoice"></i> Print KOT</button>
                        </div>
                        <button id="order_details_close_button">Close</button>
                     </div>
                  </div>
               </div>
               <!-- end add customer modal -->
               <!-- The kitchen status modal -->
               <div id="kitchen_status_modal" class="modal">
                  <!-- Modal content -->
                  <div class="modal-content" id="modal_kitchen_status_details">
                     <div class="kitchen_status_modal_info_holder fix">
                        <h1 id="kitchen_status_main_header">Kitchen Status</h1>
                        <p><span style="font-weight:bold">Order Number:</span> <span id="kitchen_status_order_number"></span> <span style="font-weight:bold">Order Type:</span> <span id="kitchen_status_order_type"></span></p>
                        <p style="text-align:left;">
                           <span style="font-weight:bold">Waiter: </span><span id="kitchen_status_waiter_name">Tamim Shahriar</span>
                           <span style="font-weight:bold">Customer: </span><span id="kitchen_status_customer_name">Faruq Hussain</span>
                           <span style="font-weight:bold">Order Table: </span><span id="kitchen_status_table">Table 01</span>
                        </p>
                        <div id="kitchen_status_detail_holder" class="fix">
                           <div id="kitchen_status_detail_header" class="fix">
                              <div class="fix first">Item</div>
                              <div class="fix second">Quantity</div>
                              <div class="fix third">Status</div>
                           </div>
                           <div id="kitchen_status_item_details" class="fix">
                              <div class="kitchen_status_single_item fix" style="background-color:#ADD8E6;">
                                 <div class="fix">Chicken Picata</div>
                                 <div class="fix">2</div>
                                 <div class="fix">Started Cooking 12:34 Min Ago</div>
                              </div>
                              <div class="kitchen_status_single_item fix" style="background-color:#90EE90;">
                                 <div class="fix">Beef Chili Onion</div>
                                 <div class="fix">3</div>
                                 <div class="fix">Done Cooking 16:34 Min Ago</div>
                              </div>
                              <div class="kitchen_status_single_item fix">
                                 <div class="fix">Tanduri Chicken</div>
                                 <div class="fix">5</div>
                                 <div class="fix">In the queue</div>
                              </div>
                           </div>
                        </div>
                        <h1 id="kitchen_status_order_placed">Order Placed at: 14:22</h1>
                        <h1 id="kitchen_status_time_count">Time Count: <span id="kitchen_status_ordered_minute">23</span>:<span id="kitchen_status_ordered_second">55</span> M</h1>
                        <button id="kitchen_status_close_button">Close</button>
                     </div>
                  </div>
               </div>
               <!-- end kitchen status modal -->
               <!-- The table modal please read -->
               <div id="please_read_modal" class="modal">
                  <!-- Modal content -->
                  <div class="modal-content" id="modal_please_read_details">
                     <p class="cross_button_to_close" id="please_read_close_button_cross">&times;</p>
                     <h1 id="please_read_modal_header" style="color: #dc3545;">Please Read</h1>
                     <div class="help_modal_info_holder fix">
                        <!-- <p class="para_type_1">How order process works</p> -->
                        <p class="para_type_1">Modify Order:</p>
                        <p class="para_type_2">If you need to add some new item to an order, please select a running order from left and click on Modify Order. We have a perfect mechanism for modifying an order, please do that from there and please don't be confused to do that here, this is only table management section of an order.</p>
                        <p class="para_type_1">What you can do here:</p>
                        <p class="para_type_2">An order may contain many person sitting in multiple tables, so you can select multiple tables for an order You can not set person more than available sit for in a table You can proceed without selecting table because some people may can gather, take tea and go out As a table can have availability of several chairs and sometime those are sharable, so you can select multiple order in a table</p>
                        <button id="please_read_close_button">Close</button>
                     </div>
                  </div>
               </div>
               <!-- end table modal please read modal -->
               <!-- The kitchen status modal -->
               <div id="help_modal" class="modal">
                  <!-- Modal content -->
                  <div class="modal-content" id="modal_help_details">
                     <p class="cross_button_to_close" id="help_close_button_cross">&times;</p>
                     <h1 id="help_modal_header" style="color: #dc3545;">Read Before Begin</h1>
                     <div class="help_modal_info_holder fix">
                        <p class="para_type_1">What is Running Order </p>
                        <p class="para_type_2">Placed order goes to Running Orders, to modify/invoice that order just select that order and click on bellow button </p>
                        <p class="para_type_1">What is Modify Order </p>
                        <p class="para_type_2">Modify order is not limited to only add new item, means modification of anything of that order, remove item, change item qty, change type, change waiter etc </p>
                        <!-- <p class="para_type_1">How order process works</p>
                           <p class="para_type_2" style="font-weight: bold;">Who take Post-Payment:</p>
                           <p class="para_type_2">Post payment means your customer orders first, then kitchen, then eat then invoice and pay.</p>
                           <p class="para_type_2">For this process, you will place the order first, that will go to Running Orders as well as to Kitchen, then the order will be hung in Running Orders until food comes from kitchen and customer finishes eating, after finishing eating, you will click on Create Invoice & Close.</p>
                           <p class="para_type_2">System will print an invoice and remove the order from Running Order list as well as change status of that order to Closed.</p>
                           <p class="para_type_2" style="font-weight: bold;">Who take Pre-Payment:</p>
                           <p class="para_type_2">Place the order and click on Create Invoice, system will print an invoice but it will not wipe the order from Running Orders as well as it will also be sent to Kitchen. And when Kitchen finishes delivery, just click on Close Order.</p>  -->
                        <p class="para_type_1">Allow Popup </p>
                        <p class="para_type_2">Please allow popup of your browser to print Invoice and KOT </p>
                        <p class="para_type_1">Print KOT </p>
                        <p class="para_type_2">Use Print KOT button if you intend to not to use Kitchen Panel </p>
                        <p class="para_type_2">When customer asks for new item or he wants an item more, just modify an order then go to print KOT, and just check that new item/quantity increased item, then reduce quantity and print the KOT, so that you can now only send the new item to kitchen </p>
                        <p class="para_type_2">But for Kitchen Panel, no need to worry, kithcen panel will be notified when an order is modified </p>
                        <p class="para_type_1">Searching </p>
                        <p class="para_type_2">Press Ctrl+Shift+F to focus on Search field </p>
                        <p class="para_type_2">Just type VEG, all veg items will be appeared </p>
                        <p class="para_type_2">Just type BEV, all beverage items will be appeared </p>
                        <p class="para_type_2">Just type Bar, all bar items will be appeared </p>
                        <p class="para_type_1">Refresh Button </p>
                        <p class="para_type_2">When you see that there refresh button right beside of running orders is red. You need to click on that button to refresh running orders to get update from kitchen. </p>
                        <p class="para_type_1">Inventory </p>
                        <p class="para_type_2">System will only deduct ingredient from inventory when you close an order by clicking on Create Invoice & Close OR Close Order button. </p>
                        <p class="para_type_1">Order Details </p>
                        <p class="para_type_2">You can also see an order's details by double clicking on it</p>
                        <p class="para_type_1">Discount </p>
                        <p class="para_type_2">Mention that discount does not applies on Modifier. </p>
                        <p class="para_type_1">Clear Cache </p>
                        <p class="para_type_2">We are using JS cache to speed up operation, so please clear your cache by Ctrl+F5 after adding a new Food Item. </p>
                        <button id="help_close_button">Close</button>
                     </div>
                  </div>
               </div>
               <!-- end kitchen status modal -->
               <!-- The Modal -->
               <div id="finalize_order_modal" class="modal">
                  <!-- Modal content -->
                  <div class="modal-content" id="modal_finalize_order_details">
                     <h1 id="modal_finalize_header">Finalize Order</h1>
                     <div class="fo_1 fix">
                        <span style="display:none;" id="finalize_update_type"></span>
                        <div class="half fix floatleft">Total Payable</div>
                        <div class="half fix floatleft textright">$ <span id="finalize_total_payable">0.00</span></div>
                     </div>
                     <div class="fo_2 fix">
                        <div class="half fix floatleft">Total Payment</div>
                        <div class="half fix floatleft textright">
                           <select name="finalie_order_payment_method" id="finalie_order_payment_method">
                              <option value="">Payment Method</option>
                              <option value="3">Cash</option>
                           </select>
                        </div>
                     </div>
                     <div class="fo_3 fix">
                        <div class="half fix floatleft textleft">Pay Amount</div>
                        <div class="half fix floatleft textright">Due Amount</div>
                        <div class="half fix floatleft textleft"><input type="text" name="pay_amount_invoice_modal_input" id="pay_amount_invoice_input"></div>
                        <div class="half fix floatleft textright"><input type="text" name="due_amount_invoice_modal_input" id="due_amount_invoice_input" disabled></div>
                     </div>
                     <div class="fo_3 fix">
                        <div class="half fix floatleft textleft">Given Amount</div>
                        <div class="half fix floatleft textright">Change Amount</div>
                        <div class="half fix floatleft textleft"><input type="text" name="given_amount_modal_input" id="given_amount_input"></div>
                        <div class="half fix floatleft textright"><input type="text" name="change_amount_modal_input" id="change_amount_input" disabled></div>
                     </div>
                     <div class="bottom_buttons fix">
                        <div class="bottom_single_button floatleft textleft half fix"><button id="finalize_order_cancel_button">Cancel</button></div>
                        <div class="bottom_single_button floatleft textright half fix"><button id="finalize_order_button">Submit</button></div>
                     </div>
                     <!-- <span class="close">&times;</span> -->
                     <!-- <p>Some text in the Modal..</p> -->
                  </div>
               </div>
               <!-- end of item modal -->
               <!-- The Notification List Modal -->
               <div id="notification_list_modal" class="modal">
                  <!-- Modal content -->
                  <div class="modal-content" id="modal_notification_list_details">
                     <h1 id="modal_notification_header">Notification List</h1>
                     <div id="notification_list_header_holder">
                        <div class="single_row_notification_header fix" style="height: 25px;border-bottom: 2px solid #cfcfcf;">
                           <div class="fix single_notification_check_box">
                              <input type="checkbox" id="select_all_notification">
                           </div>
                           <div class="fix single_notification"><strong>Select All</strong></div>
                           <div class="fix single_serve_button">
                           </div>
                        </div>
                     </div>
                     <div id="notification_list_holder" class="fix">
                     </div>
                     <!-- <span class="close">&times;</span> -->
                     <!-- <p>Some text in the Modal..</p> -->
                     <div id="notification_close_delete_button_holder">
                        <button id="notification_remove_all">Remove</button><button id="notification_close">Close</button>
                     </div>
                  </div>
               </div>
               <!-- end of notification list modal -->
               <!-- The Notification List Modal -->
               <div id="kitchen_bar_waiter_panel_button_modal" class="modal">
                  <!-- Modal content -->
                  <div class="modal-content" id="modal_kitchen_bar_waiter_details" style="position: relative;">
                     <p class="cross_button_to_close" id="kitchen_bar_waiter_modal_close_button_cross">&times;</p>
                     <h1 id="switch_panel_modal_header">Kitchen, Waiter & Bar</h1>
                     <div style="padding:30px;">
                        <a href="https://posmaxx.com/administrator/Demo_panel/switchTo/kitchen" target="_blank" style="width: 32%;display: inline-block;text-align: center;">
                        <button style="width:100%;">Kitchen Panel</button>
                        </a>
                        <a href="https://posmaxx.com/administrator/Demo_panel/switchTo/waiter" target="_blank" style="width: 32%;display: inline-block;text-align: center;">
                        <button style="width:100%;">Waiter Panel</button>
                        </a>
                        <a href="https://posmaxx.com/administrator/Demo_panel/switchTo/bar" target="_blank" style="width: 32%;display: inline-block;text-align: center;">
                        <button style="width:100%;">Bar Panel</button>
                        </a>
                     </div>
                  </div>
               </div>
               <!-- end of notification list modal -->
               <!-- The KOT Modal -->
               <div id="kot_list_modal" class="modal">
                  <!-- Modal content -->
                  <div class="modal-content" id="modal_kot_list_details">
                     <h1 id="modal_kot_header">KOT</h1>
                     <h2 id="kot_modal_modified_or_not">Modified</h2>
                     <div id="kot_header_info" class="fix">
                        <p>Order No: <span id="kot_modal_order_number"></span></p>
                        <p>Date: <span id="kot_modal_order_date"></span></p>
                        <p>Customer: <span id="kot_modal_customer_id" style="display:none;"></span><span id="kot_modal_customer_name"></span></p>
                        <p>Table: <span id="kot_modal_table_name"></span></p>
                        <p>Waiter: <span id="kot_modal_waiter_name"></span>, Order Type: <span id="kot_modal_order_type"></span></p>
                     </div>
                     <div id="kot_table_content" class="fix">
                        <div class="kot_modal_table_content_header fix">
                           <div class="kot_header_row fix floatleft kot_check_column"><input type="checkbox" id="kot_check_all"></div>
                           <div class="kot_header_row fix floatleft kot_item_name_column">Item</div>
                           <div class="kot_header_row fix floatleft kot_qty_column">Qty</div>
                           <div class="kot_header_row fix floatleft kot_modifier_column">Modifiers</div>
                        </div>
                        <div id="kot_list_holder" class="fix">
                        </div>
                     </div>
                     <div id="kot_bottom_buttons" class="fix">
                        <button id="cancel_kot_modal">Cancel</button><button id="print_kot_modal">Print KOT</button>
                     </div>
                  </div>
               </div>
               <!-- end of KOT modal -->
               <div id="calculator_main">
                  <div class="calculator">
                     <input type="text" readonly>
                     <div class="row">
                        <div class="key">1</div>
                        <div class="key">2</div>
                        <div class="key">3</div>
                        <div class="key last">0</div>
                     </div>
                     <div class="row">
                        <div class="key">4</div>
                        <div class="key">5</div>
                        <div class="key">6</div>
                        <div class="key last action instant">cl</div>
                     </div>
                     <div class="row">
                        <div class="key">7</div>
                        <div class="key">8</div>
                        <div class="key">9</div>
                        <div class="key last action instant">=</div>
                     </div>
                     <div class="row">
                        <div class="key action">+</div>
                        <div class="key action">-</div>
                        <div class="key action">x</div>
                        <div class="key last action">/</div>
                     </div>
                  </div>
               </div>
               <div id="modify_button_tool_tip" style="display:none;position: absolute;background: #fff;border: 1px solid #cfcfcf;border-radius: 5px;box-shadow: 2px 2px 2px #cfcfcf;padding:5px;">
                  <h1 class="title" style="margin:0px;font-size: 20px;line-height: 25px;">Choose This For:</h1>
                  <p style="margin:0px;margin: 0px;font-size: 14px;line-height: 16px;">1. Add New Item</p>
                  <p style="margin:0px;margin: 0px;font-size: 14px;line-height: 16px;">2. Change Table</p>
                  <p style="margin:0px;margin: 0px;font-size: 14px;line-height: 16px;">3. Change anything in an Order</p>
               </div>
               <div id="direct_invoice_button_tool_tip" style="display:none;position: absolute;background: #fff;border: 1px solid #cfcfcf;border-radius: 5px;box-shadow: 2px 2px 2px #cfcfcf;padding:5px;">
                  <h1 class="title" style="margin:0px;font-size: 20px;line-height: 25px;">For Fast Food Restaurants</h1>
               </div>
   </div>



<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
<script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
      <script type="text/javascript">
         $('.select2').select2();
         window.customers = [{customer_id:'1',customer_name:'Walk-in Customer',customer_address:'',gst_number:''},{customer_id:'2',customer_name:'Walkin',customer_address:'',gst_number:''}];
         window.items = [{item_id:'1',item_code:'001',category_name:'Main Dishes',item_name:'Kal-BI Plate',price:'$ 17.95',image:'https://posmaxx.com/administrator/assets/POS/images/1d61a4fbd3b4f0dedb13f4c897972bc6.jpg',tax_information:'[{"tax_field_id":"1","tax_field_outlet_id":"1","tax_field_company_id":"1","tax_field_name":"0","tax_field_percentage":"0"}]',vat_percentage:'',veg_item:'',beverage_item:'',bar_item:'',sold_for:'8',modifiers:[]},{item_id:'2',item_code:'002',category_name:'Main Dishes',item_name:'BBQ Chicken Plate',price:'$ 13.95',image:'https://posmaxx.com/administrator/assets/POS/images/d2f5759f5c4db49b88372d1a9b772bd6.jpg',tax_information:'[{"tax_field_id":"1","tax_field_outlet_id":"1","tax_field_company_id":"1","tax_field_name":"0","tax_field_percentage":"0"}]',vat_percentage:'',veg_item:'',beverage_item:'',bar_item:'',sold_for:'5',modifiers:[]},{item_id:'3',item_code:'003',category_name:'Bowls',item_name:'Bi Bim Bap',price:'$ 14.95',image:'https://posmaxx.com/administrator/assets/POS/images/d8af2e1107000d7f7c6e762769d5e4b4.jpg',tax_information:'[{"tax_field_id":"1","tax_field_outlet_id":"1","tax_field_company_id":"1","tax_field_name":"0","tax_field_percentage":"0"}]',vat_percentage:'',veg_item:'',beverage_item:'',bar_item:'',sold_for:'4',modifiers:[]}];
         function searchItemAndConstructGallery(searchedValue){

             var resultObject = search(searchedValue, window.items);
             return resultObject;
         }
         function searchCustomerAddress(searchValue){

             var resultObject = searchAddress(searchValue, window.customers);
             return resultObject;
         }
         $.datable();

         $('#register_close').on('click',function(){
             var r = confirm("Are you sure to close register?");

             if (r == true) {
                 $.ajax({
                     url: 'https://posmaxx.com/administrator/Sale/closeRegister',
                     method:"POST",
                     data:{
                         csrf_test_name: $.cookie('csrf_cookie_name')
                     },
                     success:function(response) {
                         swal({
                             title: 'Alert',
                             text: 'Register closed successfully!!',
                             confirmButtonText:'OK',
                             confirmButtonColor: '#b6d6f6'
                         });
                         $('#close_register_button').hide();
                         window.location.href = 'https://posmaxx.com/administrator/Authentication/logOut';

                     },
                     error:function(){
                         alert("error");
                     }
                 });
             }
         });

         $('#go_to_dashboard').on('click',function(){
             /*var r = confirm("Are you sure to close register?");

             if (r == true) {
                 $.ajax({
                     url: 'https://posmaxx.com/administrator/Sale/closeRegister',
                     method:"POST",
                     data:{
                         csrf_test_name: $.cookie('csrf_cookie_name')
                     },
                     success:function(response) {
                         swal({
                             title: 'Alert',
                             text: 'Register closed successfully!!',
                             confirmButtonColor: '#b6d6f6'
                         });
                         $('#close_register_button').hide();
                         window.location.href = 'https://posmaxx.com/administrator/Authentication/logOut';

                     },
                     error:function(){
                         alert("error");
                     }
                 });
             }  */

             window.location.href = 'https://posmaxx.com/administrator/Authentication/userProfile';
         });

      </script>
      <script type="text/javascript">
               var warning="Alert";
               var a_error="";
               var ok="OK";
               //alert(warning)
               var cancel="Cancel";
               var please_select_order_to_proceed="Please select an order to proceed";
               var exceeciding_seat="Exceeding available sit!!";
               var seat_greater_than_zero="Seat number must be greater than zero!!!";
               var are_you_sure_cancel_booking="Are you sure to cancel this booking?";
               var are_you_delete_notification="Are you sure to delete all notifications?";
               var no_notification_select="No notification is selected";
               var are_you_delete_all_hold_sale="Are you sure to delete all hold sales?";
               var no_hold="There is no hold!";
               var sure_delete_this_hold="Are you sure to delete this hold?";
               var please_select_hold_sale="Please select a Hold Sale to proceed!";
               var delete_only_for_admin="Delete is only allowed for Admin";
               var sure_delete_this_order="Are you sure to delete this order?";
               var sure_cancel_this_order="Are you sure to cancel this order?";
               var please_select_an_order="Please select an order to proceed!";
               var cart_not_empty="Cart is not empty, want to proceed?";
               var cart_not_empty_want_to_clear="Cart is not empty, want to clear the cart?";
               var progress_or_done_kitchen="You can not remove or modify any item that is In Progress or Done in Kitchen";
               var order_in_progress_or_done="Order is In Progress or Done, you can not cancel it!";
               var close_order_without="You can not close an order without invoicing!";
               var want_to_close_order="Do you want to close this order?";
               var please_select_open_order="Please select an Open Order to proceed!";
               var cart_empty="Cart is empty!";
               var select_a_customer="Please select A Customer!";
               var select_a_waiter="Please select A Waiter!";
               var delivery_not_possible_walk_in="Delivery is not possible for Walk-in Customer, please choose another!";
               var delivery_for_customer_must_address="For Delivery order, customer must has a Delivery Address!";
               var select_dine_take_delivery="You must select Dine In or Take Away or Delivery!";
               var added_running_order="Order has been added to Running Orders and went to Kitchen Panel as well. Select any order from Running Orders to modify it or create invoice";

function myFunction(){
    $(show_tables_modal2).modal('show');
}
function openHoldSales(){
    $(show_sale_hold_modal).modal('show');
}
function helpModalOpen(){
    $(help_modal).modal('show');
}
function plusButton(){
    $(add_customer_modal).modal('show');
}
function lastTenSales(){
    $(show_last_ten_sales_modal).modal('show');
}
function notifactionList(){
    $(notification_list_modal).modal('show');
}
</script>
</body>
</html>
