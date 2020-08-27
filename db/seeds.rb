Report.delete_all

User.create(
    username: "a", password: "1"
)

Report.create(
    user_id: 1,
    location: "St Paul, MN",
    temperature: 80,
    temp_unit: "f",
    current_conditions:"Mostly Cloudy",
    pressure: 1012, pressure_unit: "mb",
    wind_speed: 7,
    wind_direction: "SE",
    wind_unit: "mph",
    relative_humidity: 55,
    cloud_cover: 70,
    cloud_type: "Cumulus",
    precipitation: 0,
    precip_unit: "in"
)