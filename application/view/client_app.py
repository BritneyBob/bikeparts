from application.view.options import main_menu, product_menu, customer_menu, procurement_menu, pricing_menu, store_menu


def main():
    # TODO All subchoices have to be replaced with methods to redirect user to their choice
    while True:
        menu_choice = main_menu()
        match menu_choice:
            case "1":
                while True:
                    sub_choice = product_menu()
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
            case "2":
                while True:
                    sub_choice = pricing_menu()
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
            case "3":
                while True:
                    sub_choice = customer_menu()
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
            case "4":
                while True:
                    sub_choice = procurement_menu()
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
                    sub_choice = store_menu()
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
            case "9":
                print("You chose to exit the program. Have a nice day!")
                break


if __name__ == '__main__':
    main()