from application.data.repository import car_model_repository


def create_car_model(car_model):
    car_model_repository.create_car_model(car_model)


def create_car_model_spare_part(car_model, spare_part):
    car_model_repository.create_car_model_spare_part(car_model, spare_part)


def get_car_model_by_id(car_model_id):
    return car_model_repository.get_car_model_by_id(car_model_id)