from application.data.repository import car_model_repository


def create_car_model(car_model):
    car_model_repository.create_car_model(car_model)
