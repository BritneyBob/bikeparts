# from application.view.options import main_menu, product_menu, customer_menu, procurement_menu,
# pricing_menu, store_menu
# from application.view.spare_parts import show_all_spare_parts, show_spare_part
from application.view import options, spare_parts, customers, suppliers, stores


def main():
    # TODO All subchoices have to be replaced with methods to redirect user to their choice
    while True:
        menu_choice = options.main_menu()
        match menu_choice:
            case "1":
                while True:
                    sub_choice = options.product_menu()
                    match sub_choice:
                        case "1":
                            spare_parts.show_all_spare_parts()
                        case "2":
                            spare_parts.show_spare_part()
                        case "3":
                            print("<This string will be replaced with method to redirect user>")
                        case "4":
                            print("<This string will be replaced with method to redirect user>")
                        case "9":
                            print("Going back to main menu")
                            break
            case "2":
                while True:
                    sub_choice = options.pricing_menu()
                    match sub_choice:
                        case "1":
                            suppliers.negotiate_supplier_prices()
                        case "2":
                            spare_parts.adjust_sell_margins()
                        case "3":
                            print("<This string will be replaced with method to redirect user>")
                        case "9":
                            print("Going back to main menu")
                            break
            case "3":
                while True:
                    sub_choice = options.customer_menu()
                    match sub_choice:
                        case "1":
                            customers.show_all_customers()
                        case "2":
                            customers.show_all_customer_orders()
                        case "3":
                            customers.place_order()
                        case "9":
                            print("Going back to main menu")
                            break
            case "4":
                while True:
                    sub_choice = options.procurement_menu()
                    match sub_choice:
                        case "1":
                            print("<This string will be replaced with method to redirect user>")
                        case "2":
                            print("<This string will be replaced with method to redirect user>")
                        case "3":
                            print("<This string will be replaced with method to redirect user>")
                        case "9":
                            print("Going back to main menu")
                            break
            case "5":
                while True:
                    sub_choice = options.store_menu()
                    match sub_choice:
                        case "1":
                            stores.view_all_stores()
                        case "2":
                            print("<This string will be replaced with method to redirect user>")
                        case "3":
                            print("<This string will be replaced with method to redirect user>")
                        case "9":
                            print("Going back to main menu")
                            break
            case "9":
                print("You chose to exit the program. Have a nice day!")
                break


if __name__ == '__main__':
    main()
