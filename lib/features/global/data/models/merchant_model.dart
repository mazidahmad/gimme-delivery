/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'model_provider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;

/** This is an auto generated class representing the MerchantModel type in your schema. */
class MerchantModel extends amplify_core.Model {
  static const classType = const _MerchantModelModelType();
  final String id;
  final String? _merchant_name;
  final String? _address;
  final double? _longitude;
  final double? _latitude;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  MerchantModelModelIdentifier get modelIdentifier {
    return MerchantModelModelIdentifier(id: id);
  }

  String get merchant_name {
    try {
      return _merchant_name!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get address {
    try {
      return _address!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  double get longitude {
    try {
      return _longitude!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  double get latitude {
    try {
      return _latitude!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const MerchantModel._internal(
      {required this.id,
      required merchant_name,
      required address,
      required longitude,
      required latitude,
      createdAt,
      updatedAt})
      : _merchant_name = merchant_name,
        _address = address,
        _longitude = longitude,
        _latitude = latitude,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory MerchantModel(
      {String? id,
      required String merchant_name,
      required String address,
      required double longitude,
      required double latitude}) {
    return MerchantModel._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        merchant_name: merchant_name,
        address: address,
        longitude: longitude,
        latitude: latitude);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MerchantModel &&
        id == other.id &&
        _merchant_name == other._merchant_name &&
        _address == other._address &&
        _longitude == other._longitude &&
        _latitude == other._latitude;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("MerchantModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("merchant_name=" + "$_merchant_name" + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("longitude=" +
        (_longitude != null ? _longitude!.toString() : "null") +
        ", ");
    buffer.write("latitude=" +
        (_latitude != null ? _latitude!.toString() : "null") +
        ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  MerchantModel copyWith(
      {String? merchant_name,
      String? address,
      double? longitude,
      double? latitude}) {
    return MerchantModel._internal(
        id: id,
        merchant_name: merchant_name ?? this.merchant_name,
        address: address ?? this.address,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude);
  }

  MerchantModel copyWithModelFieldValues(
      {ModelFieldValue<String>? merchant_name,
      ModelFieldValue<String>? address,
      ModelFieldValue<double>? longitude,
      ModelFieldValue<double>? latitude}) {
    return MerchantModel._internal(
        id: id,
        merchant_name:
            merchant_name == null ? this.merchant_name : merchant_name.value,
        address: address == null ? this.address : address.value,
        longitude: longitude == null ? this.longitude : longitude.value,
        latitude: latitude == null ? this.latitude : latitude.value);
  }

  MerchantModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _merchant_name = json['merchant_name'],
        _address = json['address'],
        _longitude = (json['longitude'] as num?)?.toDouble(),
        _latitude = (json['latitude'] as num?)?.toDouble(),
        _createdAt = json['createdAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'merchant_name': _merchant_name,
        'address': _address,
        'longitude': _longitude,
        'latitude': _latitude,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'merchant_name': _merchant_name,
        'address': _address,
        'longitude': _longitude,
        'latitude': _latitude,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<MerchantModelModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<MerchantModelModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final MERCHANT_NAME =
      amplify_core.QueryField(fieldName: "merchant_name");
  static final ADDRESS = amplify_core.QueryField(fieldName: "address");
  static final LONGITUDE = amplify_core.QueryField(fieldName: "longitude");
  static final LATITUDE = amplify_core.QueryField(fieldName: "latitude");
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MerchantModel";
    modelSchemaDefinition.pluralName = "MerchantModels";

    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
          authStrategy: amplify_core.AuthStrategy.PUBLIC,
          operations: const [amplify_core.ModelOperation.READ])
    ];

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: MerchantModel.MERCHANT_NAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: MerchantModel.ADDRESS,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: MerchantModel.LONGITUDE,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: MerchantModel.LATITUDE,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(
        amplify_core.ModelFieldDefinition.nonQueryField(
            fieldName: 'createdAt',
            isRequired: false,
            isReadOnly: true,
            ofType: amplify_core.ModelFieldType(
                amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(
        amplify_core.ModelFieldDefinition.nonQueryField(
            fieldName: 'updatedAt',
            isRequired: false,
            isReadOnly: true,
            ofType: amplify_core.ModelFieldType(
                amplify_core.ModelFieldTypeEnum.dateTime)));
  });
}

class _MerchantModelModelType extends amplify_core.ModelType<MerchantModel> {
  const _MerchantModelModelType();

  @override
  MerchantModel fromJson(Map<String, dynamic> jsonData) {
    return MerchantModel.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'MerchantModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [MerchantModel] in your schema.
 */
class MerchantModelModelIdentifier
    implements amplify_core.ModelIdentifier<MerchantModel> {
  final String id;

  /** Create an instance of MerchantModelModelIdentifier using [id] the primary key. */
  const MerchantModelModelIdentifier({required this.id});

  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{'id': id});

  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
      .entries
      .map((entry) => (<String, dynamic>{entry.key: entry.value}))
      .toList();

  @override
  String serializeAsString() => serializeAsMap().values.join('#');

  @override
  String toString() => 'MerchantModelModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is MerchantModelModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
