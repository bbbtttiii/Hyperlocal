Report.delete_all

User.create(
    username: "a", password: "1"
)

User.create(
    username: "b", password: "2"
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

Report.create(
    user_id: 2,
    location: "Wichita, KS",
    temperature: 82,
    temp_unit: "f",
    current_conditions:"Overcast",
    pressure: 998, pressure_unit: "mb",
    wind_speed: 13,
    wind_direction: "S",
    wind_unit: "mph",
    relative_humidity: 75,
    cloud_cover: 95,
    cloud_type: "Stratus",
    precipitation: 0.7,
    precip_unit: "in"
)