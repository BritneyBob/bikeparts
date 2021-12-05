from application.data.db import session
from application.data.models import CustomerCar
from application.data.repository import customer_car_repository


def create_customer_car(customer_car):
    customer_car_repository.create_customer_car(customer_car)


def get_customers_cars(customer_id):
    customer_car_repository.get_customers_cars(customer_id)