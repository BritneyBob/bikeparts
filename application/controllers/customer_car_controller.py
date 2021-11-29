from application.data.repository import customer_car_repository


def create_customer_car(customer_car):
    customer_car_repository.create_customer_car(customer_car)
