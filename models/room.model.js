class Room {

    type =  ["Room", "Apartments", "Cottage", "Flat", "Villa"]
    class = ["Standart", "Confort", "Lux", "Premium"]
    number_of_rooms = 1
    max_number_of_guests = 1
    number_od_beds = 1

    Convenient = {
        "kitchen" : true,
        "free wifi" : true,
        "washing_machine" : true,
        "tv" : true,
        "view_of_the_city" : true,
        "kitchen" : true,
        "kitchen" : true,
        "baby_cot_available": true
    }

    price_for_night = 3000
}

class Booking {

    start_date
    end_date
    number_of_guests
    guests = []
    
}

class Guest {
    firstname
    lastname
    middlename
    age
}