from application.data.repository import spare_parts_repository as spr


def get_spare_parts():
    return spr.get_spare_parts()


def get_spare_part_by_id(_id):
    return spr.get_spare_part_by_id(_id)


def get_spare_part_supplier_by_id(_id):
    return spr.get_spare_part_supplier_by_id(_id)


def get_spare_parts_by_filter(_filter):
    return spr.get_spare_parts_by_filter(_filter)
