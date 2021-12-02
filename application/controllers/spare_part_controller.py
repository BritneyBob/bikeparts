from application.data.repository import spare_part_repository


def create_spare_part(spare_part):
    spare_part_repository.create_spare_part(spare_part)


def create_spare_part_supplier(spare_part_supplier):
    spare_part_repository.create_spare_part_supplier(spare_part_supplier)


def get_spare_parts():
    return spare_part_repository.get_spare_parts()


def get_spare_part_by_id(_id):
    return spare_part_repository.get_spare_part_by_id(_id)


def get_spare_part_supplier_by_id(_id):
    return spare_part_repository.get_spare_part_supplier_by_id(_id)


def get_spare_parts_by_filter(_filter):
    return spare_part_repository.get_spare_parts_by_filter(_filter)
