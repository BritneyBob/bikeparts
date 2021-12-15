from application.data.dataMDB.repositoryMDB import company_repository


def create_company(company):
    company_repository.create_company(company)


def get_all_companies():
    return company_repository.get_all_companies()


def get_company_by_id(company_id):
    return company_repository.get_company_by_id(company_id)


def get_companies_by_ids(company_ids):
    return company_repository.get_companies_by_ids(company_ids)


def negotiation(id_and_buy_price, comp_and_supp_id):
    return company_repository.negotiation(id_and_buy_price, comp_and_supp_id)


def update_company_name(company, new_company_name):
    return company_repository.update_company_name(company, new_company_name)


def update_contact_phone_number(company, new_phone_number):
    return company_repository.update_contact_phone_number(company, new_phone_number)


def update_company_address(company, address):
    company_repository.update_company_address(company, address)


def update_contact_name(company, new_contact_first_name, new_contact_last_name):
    return company_repository.update_contact_name(company, new_contact_first_name, new_contact_last_name)
