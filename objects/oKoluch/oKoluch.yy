{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "oKoluch",
  "spriteId": {
    "name": "sKoluchStop",
    "path": "sprites/sKoluchStop/sKoluchStop.yy",
  },
  "solid": false,
  "visible": true,
  "managed": true,
  "spriteMaskId": {
    "name": "sKoluchMask",
    "path": "sprites/sKoluchMask/sKoluchMask.yy",
  },
  "persistent": false,
  "parentObjectId": {
    "name": "oCharacter",
    "path": "objects/oCharacter/oCharacter.yy",
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
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":4,"collisionObjectId":{"name":"oPlayer","path":"objects/oPlayer/oPlayer.yy",},},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,},
  ],
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"damage","varType":0,"value":"4","rangeEnabled":true,"rangeMin":-100.0,"rangeMax":100.0,"listItems":[],"multiselect":false,"filters":[],},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"damageDuration","varType":0,"value":"1","rangeEnabled":true,"rangeMin":0.0,"rangeMax":3.0,"listItems":[],"multiselect":false,"filters":[],},
  ],
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"name","path":"objects/oCreature/oCreature.yy",},"objectId":{"name":"oCreature","path":"objects/oCreature/oCreature.yy",},"value":"\"Koluch\"",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"hp","path":"objects/oCreature/oCreature.yy",},"objectId":{"name":"oCreature","path":"objects/oCreature/oCreature.yy",},"value":"7",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"isMoving","path":"objects/oCharacter/oCharacter.yy",},"objectId":{"name":"oCharacter","path":"objects/oCharacter/oCharacter.yy",},"value":"1",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"movingBorderLeft","path":"objects/oCharacter/oCharacter.yy",},"objectId":{"name":"oCharacter","path":"objects/oCharacter/oCharacter.yy",},"value":"x - 200",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"movingBorderRight","path":"objects/oCharacter/oCharacter.yy",},"objectId":{"name":"oCharacter","path":"objects/oCharacter/oCharacter.yy",},"value":"x + 200",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"decelRate","path":"objects/oCreature/oCreature.yy",},"objectId":{"name":"oCreature","path":"objects/oCreature/oCreature.yy",},"value":"0.1",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"breatheSpeed","path":"objects/oCreature/oCreature.yy",},"objectId":{"name":"oCreature","path":"objects/oCreature/oCreature.yy",},"value":"0.48",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"accelRate","path":"objects/oCreature/oCreature.yy",},"objectId":{"name":"oCreature","path":"objects/oCreature/oCreature.yy",},"value":"0.1",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","propertyId":{"name":"maxsp","path":"objects/oCreature/oCreature.yy",},"objectId":{"name":"oCreature","path":"objects/oCreature/oCreature.yy",},"value":"300",},
  ],
  "parent": {
    "name": "Creatures",
    "path": "folders/Objects/Creatures.yy",
  },
}