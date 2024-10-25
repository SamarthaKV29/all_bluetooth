part of "package:all_bluetooth/all_bluetooth.dart";

/// This object contains the information about the bluetooth device.
/// It contains the name and address of the device.
class BluetoothDevice {
  /// The name of the bluetooth device. It could be null,
  /// in which case, "unknown device" is returned
  final String? name;

  /// The is the address of the bluetooth device, specifically the MAC address.
  final String address;

  /// The tells the bonded state of the device
  final int? bondState;
  final int? type;
  final String? majorClass;
  final String? deviceClass;

  final String? rssi;

  BluetoothDevice({
    required this.name,
    required this.address,
    required this.bondState,
    required this.type,
    required this.majorClass,
    required this.deviceClass,
    required this.rssi,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'bond_state': bondState,
      'type': type,
      'major_class': majorClass,
      'device_class': deviceClass,
      'rssi': rssi,
    };
  }

  factory BluetoothDevice.fromMap(Object? data) {
    final map = HelperFunctions.convertToMap(data);
    debugPrint(map.keys.toList().toString());

    return BluetoothDevice(
      name: map['name'],
      address: map['address'],
      bondState: map['bond_state'],
      type: map['type'],
      majorClass: map['major_class'],
      deviceClass: map['device_class'],
      rssi: map['rssi'],
    );
  }

  @override
  String toString() =>
      'BluetoothDevice(name: $name, address: $address, bonded_state: $bondState, rssi: $rssi)';

  @override
  bool operator ==(Object other) {
    // if (identical(this, other)) return true;
    //
    // return other is BluetoothDevice &&
    //     other.name == name &&
    //     other.bondedState == bondedState &&
    //     other.address == address;
    return other is BluetoothDevice && other.address == address;
  }

  @override
  int get hashCode => name.hashCode ^ bondState.hashCode ^ address.hashCode;
}
