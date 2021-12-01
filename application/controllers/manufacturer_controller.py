from application.data.repository import manufacturer_repository


def create_manufacturer(manufacturer):
    manufacturer_repository.create_manufacturer(manufacturer)
