{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "oPlayer",
  "spriteId": {
    "name": "sPlayerStop",
    "path": "sprites/sPlayerStop/sPlayerStop.yy",
  },
  "solid": false,
  "visible": true,
  "managed": true,
  "spriteMaskId": {
    "name": "sPlayerMask",
    "path": "sprites/sPlayerMask/sPlayerMask.yy",
  },
  "persistent": true,
  "parentObjectId": {
    "name": "oCreature",
    "path": "objects/oCreature/oCreature.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":69,"eventType":9,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":7,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":76,"eventType":7,"collisionObjectId":null,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":4,"eventType":7,"collisionObjectId":null,},
  ],
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"stompName","varType":2,"value":"\"sndStomp\"","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"jumpName","varType":2,"value":"\"sndJump\"","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"deathName","varType":2,"value":"\"sndDeath\"","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],},
  ],
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"name","path":"objects/oCreature/oCreature.yy",},"objectId":{"name":"oCreature","path":"objects/oCreature/oCreature.yy",},"value":"\"Player\"",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"maxsp","path":"objects/oCreature/oCreature.yy",},"objectId":{"name":"oCreature","path":"objects/oCreature/oCreature.yy",},"value":"270",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"jumpForce","path":"objects/oCreature/oCreature.yy",},"objectId":{"name":"oCreature","path":"objects/oCreature/oCreature.yy",},"value":"900",},
  ],
  "parent": {
    "name": "Creatures",
    "path": "folders/Objects/Creatures.yy",
  },
}