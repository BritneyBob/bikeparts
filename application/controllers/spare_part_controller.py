from application.data.repository import spare_part_repository


def create_spare_part(spare_part):
    spare_part_repository.create_spare_part(spare_part)


def create_spare_part_supplier(spare_part_supplier):
    spare_part_repository.create_spare_part_supplier(spare_part_supplier)
