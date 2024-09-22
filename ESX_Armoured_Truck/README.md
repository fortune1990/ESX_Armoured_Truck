# Armored Truck Heist (ESX)

This script spawns armored trucks for heists, which can be delivered to designated chop shop locations for rewards. It features police interaction and a configurable system for chop shops and rewards.

## Features

- **Spawn Armored Trucks**: Only available when a minimum number of police are on duty.
- **Chop Shop Delivery**: Trucks can be delivered to multiple predefined chop shop locations.
- **Dynamic Blips**: Permanent blips for chop shop locations on the map.
- **Police Dispatch**: Notifies police when a truck is spawned.
- **Rewards System**: Players can earn money and items for successful deliveries.

## Installation

1. **Download the Script**: Clone or download the repository.
2. **Place in Resources**: Copy the entire folder into your `resources` directory.
3. **Add to Server Config**: Include the resource in your server configuration file (`server.cfg`):
    ```
    ensure ESX_Armoured_Truck
    ```

## Configuration

The script can be configured in `config.lua`. Key settings include:

- **Minimum Police Required**: Set the number of police needed to spawn the truck.
- **Truck Model**: Specify the model of the armored truck.
- **Spawn Locations**: Define the coordinates where trucks can spawn.
- **Chop Shop Locations**: Set the coordinates for the chop shops where trucks can be delivered.
- **Blip Settings**: Customize the appearance of chop shop blips (sprite, color, scale, and name).
- **Rewards**: Configure the money and items rewarded upon successful delivery.

## Requirements

- **ESX Framework**: Ensure you have the ESX framework installed on your server.
- **es_extended**: This script uses the ESX exports for player management and notifications.

## Support

If you encounter any issues or have questions, please open an issue in the repository.

## License

This project is licensed under the MIT License.Please feel free to add to it ,Please no RESALE ! ENJOY !
