from application.view_mdb import options, products, customers, stores, customer_orders, companies


def main():
    # TODO All sub choices have to be replaced with methods to redirect user to their choice
    while True:
        menu_choice = options.main_menu()
        match menu_choice:
            case "1":
                while True:
                    sub_choice = options.product_menu()
                    match sub_choice:
                        case "1":
                            products.search_products()
                        case "2":
                            products.show_one_product()
                        case "3":
                            products.update_a_product()
                        case "4":
                            products.add_product()
                        case "9":
                            print("Going back to main menu")
                            break

            case "2":
                while True:
                    sub_choice = options.pricing_menu()
                    match sub_choice:
                        case "1":
                            companies.negotiate_supplier_prices()
                        case "2":
                            pass
                            products.adjust_sell_margins()
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
                            customers.update_customer()
                        case "3":
                            customer_orders.show_all_customer_orders()
                        case "4":
                            customer_orders.update_customer_order()
                        case "5":
                            customer_orders.place_order_choices()
                        case "9":
                            print("Going back to main menu")
                            break

            case "4":
                while True:
                    sub_choice = options.procurement_menu()
                    match sub_choice:
                        case "1":
                            companies.view_companies()
                        case "2":
                            companies.update_company()
                        case "3":
                            companies.place_order_from_supplier()
                        case "9":
                            print("Going back to main menu")
                            break
            case "5":
                stores.view_all_stores()

            case "9":
                print("You chose to exit the program. Have a nice day!")
                break


if __name__ == '__main__':
    main()
