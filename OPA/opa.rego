package barmanagement
import future.keywords

default allow = false

allow {
    order_beer
}
allow {
    order_drink
}
allow{
    manage_bar
}

jwt_decode(token) = decoded_token {
    parts := split(token, " ")
    count(parts) == 2
    jwt := parts[1]
    [header, payload, signature] := io.jwt.decode(jwt)
    decoded_token := [header, payload, signature]
    print(decoded_token)
}

order_drink {
    input.request.method == "POST"
    input.request.path == "/api/bar"
    input.request.body.DrinkName == "Fristi"
}

order_beer {
    input.request.method == "POST"
    input.request.path == "/api/bar"
    input.request.body.DrinkName == "Beer"

    jwt := jwt_decode(input.request.headers.Authorization)
    age := to_number(jwt[1].age)
    age >= 16
}

manage_bar{
    input.request.method == "POST"
    input.request.path == "/api/managebar"
    authorize_bar("bartender", "adult")
}

authorize_bar(role, type_Drink){
    token := jwt_decode(input.request.headers.Authorization)
    user_role := token[1].role

    some x
    user_role[1] == role
    type_Drink == "adult"
}