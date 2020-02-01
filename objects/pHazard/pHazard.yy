{
    "id": "59ed7b84-561e-4e04-99d3-809f0169dcf9",
    "modelName": "GMObject",
    "mvc": "1.0",
    "name": "pHazard",
    "eventList": [
        {
            "id": "8a4020f1-c984-467d-9269-e6b4739647fd",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 0,
            "m_owner": "59ed7b84-561e-4e04-99d3-809f0169dcf9"
        },
        {
            "id": "d99b2c2c-8883-414a-91da-8d71b358f9d1",
            "modelName": "GMEvent",
            "mvc": "1.0",
            "IsDnD": false,
            "collisionObjectId": "00000000-0000-0000-0000-000000000000",
            "enumb": 0,
            "eventtype": 3,
            "m_owner": "59ed7b84-561e-4e04-99d3-809f0169dcf9"
        }
    ],
    "maskSpriteId": "00000000-0000-0000-0000-000000000000",
    "overriddenProperties": null,
    "parentObjectId": "00000000-0000-0000-0000-000000000000",
    "persistent": false,
    "physicsAngularDamping": 0.1,
    "physicsDensity": 0.5,
    "physicsFriction": 0.2,
    "physicsGroup": 0,
    "physicsKinematic": false,
    "physicsLinearDamping": 0.1,
    "physicsObject": false,
    "physicsRestitution": 0.1,
    "physicsSensor": false,
    "physicsShape": 1,
    "physicsShapePoints": null,
    "physicsStartAwake": true,
    "properties": [
        {
            "id": "6beea397-ff00-493d-85d6-10bfad0b741a",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "HAZARDS.FIRE",
            "varName": "hazard_type",
            "varType": 4
        },
        {
            "id": "d2f0c48a-47f6-4ee3-9e06-341824085c51",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "10",
            "varName": "priority",
            "varType": 1
        },
        {
            "id": "ba51cdd2-c115-42cb-bd0b-4e6132ad2bfc",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "5",
            "varName": "damage",
            "varType": 1
        },
        {
            "id": "8e64fad3-e67c-4b41-978c-c3e634da9a98",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "FIRE BREACH",
            "varName": "hazard_text",
            "varType": 2
        },
        {
            "id": "17be64e1-3bc2-406f-840e-9a73a50c55fd",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "c_yellow",
            "varName": "hazard_color",
            "varType": 4
        },
        {
            "id": "850d54f4-0c79-4c99-bf39-1ed4b7d9798f",
            "modelName": "GMObjectProperty",
            "mvc": "1.0",
            "listItems": null,
            "multiselect": false,
            "rangeEnabled": false,
            "rangeMax": 10,
            "rangeMin": 0,
            "resourceFilter": 1023,
            "value": "True",
            "varName": "damage_do",
            "varType": 3
        }
    ],
    "solid": false,
    "spriteId": "00000000-0000-0000-0000-000000000000",
    "visible": true
}