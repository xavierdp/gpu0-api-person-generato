# /apps/form-v4/app/gpu0-api-person-generator/generate_person.py
import random
import uuid

def generate_person_with_cb():
    """
    Generates mock person data along with credit card details.
    """
    first_names = ["John", "Jane", "Alex", "Emily", "Chris", "Katie"]
    last_names = ["Doe", "Smith", "Jones", "Williams", "Brown", "Davis"]
    domains = ["example.com", "mail.com", "test.org"]
    streets = ["Main St", "High St", "Oak St", "Park Ave"]
    cities = ["Anytown", "Springfield", "Shelbyville", "Metropolis"]
    regions = ["StateA", "StateB", "ProvinceC"]
    countries = ["USA", "Canada", "UK"]
    card_types = ["Visa", "MasterCard", "Amex"]

    first_name = random.choice(first_names)
    last_name = random.choice(last_names)
    email = f"{first_name.lower()}.{last_name.lower()}@{random.choice(domains)}"
    
    # Basic person details
    person = {
        "id": str(uuid.uuid4()), # Unique ID for the person
        "firstName": first_name,
        "lastName": last_name,
        "email": email,
        "phone": f"+1-{random.randint(100, 999)}-{random.randint(100, 999)}-{random.randint(1000, 9999)}",
        "street": f"{random.randint(1, 1000)} {random.choice(streets)}",
        "city": random.choice(cities),
        "region": random.choice(regions),
        "postalCode": str(random.randint(10000, 99999)),
        "country": random.choice(countries),
    }

    # Credit card details (using field names from memory)
    raw_card_number = "".join([str(random.randint(0, 9)) for _ in range(16)])
    person["card_number"] = raw_card_number
    person["card_formatted"] = f"{raw_card_number[:4]} {raw_card_number[4:8]} {raw_card_number[8:12]} {raw_card_number[12:]}"
    person["card_month"] = str(random.randint(1, 12)).zfill(2)
    person["card_year"] = str(random.randint(2025, 2030)) # Future expiry
    person["card_cvc"] = "".join([str(random.randint(0, 9)) for _ in range(3)])
    person["card_type"] = random.choice(card_types)
    
    return person
