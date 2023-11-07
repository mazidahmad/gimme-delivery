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

/** This is an auto generated class representing the DeliveryModel type in your schema. */
class DeliveryModel extends amplify_core.Model {
  static const classType = const _DeliveryModelModelType();
  final String id;
  final double? _distance;
  final PickUpModel? _pickUpModel;
  final amplify_core.TemporalDateTime? _est_delivery_time;
  final DropOffModel? _dropOffModel;
  final String? _status;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _deliveryModelPickUpModelId;
  final String? _deliveryModelDropOffModelId;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  DeliveryModelModelIdentifier get modelIdentifier {
    return DeliveryModelModelIdentifier(id: id);
  }

  double get distance {
    try {
      return _distance!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  PickUpModel? get pickUpModel {
    return _pickUpModel;
  }

  amplify_core.TemporalDateTime? get est_delivery_time {
    return _est_delivery_time;
  }

  DropOffModel? get dropOffModel {
    return _dropOffModel;
  }

  String get status {
    try {
      return _status!;
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

  String? get deliveryModelPickUpModelId {
    return _deliveryModelPickUpModelId;
  }

  String? get deliveryModelDropOffModelId {
    return _deliveryModelDropOffModelId;
  }

  const DeliveryModel._internal(
      {required this.id,
      required distance,
      pickUpModel,
      est_delivery_time,
      dropOffModel,
      required status,
      createdAt,
      updatedAt,
      deliveryModelPickUpModelId,
      deliveryModelDropOffModelId})
      : _distance = distance,
        _pickUpModel = pickUpModel,
        _est_delivery_time = est_delivery_time,
        _dropOffModel = dropOffModel,
        _status = status,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _deliveryModelPickUpModelId = deliveryModelPickUpModelId,
        _deliveryModelDropOffModelId = deliveryModelDropOffModelId;

  factory DeliveryModel(
      {String? id,
      required double distance,
      PickUpModel? pickUpModel,
      amplify_core.TemporalDateTime? est_delivery_time,
      DropOffModel? dropOffModel,
      required String status,
      String? deliveryModelPickUpModelId,
      String? deliveryModelDropOffModelId}) {
    return DeliveryModel._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        distance: distance,
        pickUpModel: pickUpModel,
        est_delivery_time: est_delivery_time,
        dropOffModel: dropOffModel,
        status: status,
        deliveryModelPickUpModelId: deliveryModelPickUpModelId,
        deliveryModelDropOffModelId: deliveryModelDropOffModelId);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeliveryModel &&
        id == other.id &&
        _distance == other._distance &&
        _pickUpModel == other._pickUpModel &&
        _est_delivery_time == other._est_delivery_time &&
        _dropOffModel == other._dropOffModel &&
        _status == other._status &&
        _deliveryModelPickUpModelId == other._deliveryModelPickUpModelId &&
        _deliveryModelDropOffModelId == other._deliveryModelDropOffModelId;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("DeliveryModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("distance=" +
        (_distance != null ? _distance!.toString() : "null") +
        ", ");
    buffer.write("est_delivery_time=" +
        (_est_delivery_time != null ? _est_delivery_time!.format() : "null") +
        ", ");
    buffer.write("status=" + "$_status" + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write("updatedAt=" +
        (_updatedAt != null ? _updatedAt!.format() : "null") +
        ", ");
    buffer.write(
        "deliveryModelPickUpModelId=" + "$_deliveryModelPickUpModelId" + ", ");
    buffer.write(
        "deliveryModelDropOffModelId=" + "$_deliveryModelDropOffModelId");
    buffer.write("}");

    return buffer.toString();
  }

  DeliveryModel copyWith(
      {double? distance,
      PickUpModel? pickUpModel,
      amplify_core.TemporalDateTime? est_delivery_time,
      DropOffModel? dropOffModel,
      String? status,
      String? deliveryModelPickUpModelId,
      String? deliveryModelDropOffModelId}) {
    return DeliveryModel._internal(
        id: id,
        distance: distance ?? this.distance,
        pickUpModel: pickUpModel ?? this.pickUpModel,
        est_delivery_time: est_delivery_time ?? this.est_delivery_time,
        dropOffModel: dropOffModel ?? this.dropOffModel,
        status: status ?? this.status,
        deliveryModelPickUpModelId:
            deliveryModelPickUpModelId ?? this.deliveryModelPickUpModelId,
        deliveryModelDropOffModelId:
            deliveryModelDropOffModelId ?? this.deliveryModelDropOffModelId);
  }

  DeliveryModel copyWithModelFieldValues(
      {ModelFieldValue<double>? distance,
      ModelFieldValue<PickUpModel?>? pickUpModel,
      ModelFieldValue<amplify_core.TemporalDateTime?>? est_delivery_time,
      ModelFieldValue<DropOffModel?>? dropOffModel,
      ModelFieldValue<String>? status,
      ModelFieldValue<String?>? deliveryModelPickUpModelId,
      ModelFieldValue<String?>? deliveryModelDropOffModelId}) {
    return DeliveryModel._internal(
        id: id,
        distance: distance == null ? this.distance : distance.value,
        pickUpModel: pickUpModel == null ? this.pickUpModel : pickUpModel.value,
        est_delivery_time: est_delivery_time == null
            ? this.est_delivery_time
            : est_delivery_time.value,
        dropOffModel:
            dropOffModel == null ? this.dropOffModel : dropOffModel.value,
        status: status == null ? this.status : status.value,
        deliveryModelPickUpModelId: deliveryModelPickUpModelId == null
            ? this.deliveryModelPickUpModelId
            : deliveryModelPickUpModelId.value,
        deliveryModelDropOffModelId: deliveryModelDropOffModelId == null
            ? this.deliveryModelDropOffModelId
            : deliveryModelDropOffModelId.value);
  }

  DeliveryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _distance = (json['distance'] as num?)?.toDouble(),
        _pickUpModel = json['PickUpModel'] != null
            ? PickUpModel.fromJson(
                new Map<String, dynamic>.from(json['PickUpModel']))
            : null,
        _est_delivery_time = json['est_delivery_time'] != null
            ? amplify_core.TemporalDateTime.fromString(
                json['est_delivery_time'])
            : null,
        _dropOffModel = json['DropOffModel'] != null
            ? DropOffModel.fromJson(
                new Map<String, dynamic>.from(json['DropOffModel']))
            : null,
        _status = json['status'],
        _createdAt = json['createdAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['updatedAt'])
            : null,
        _deliveryModelPickUpModelId = json['deliveryModelPickUpModelId'],
        _deliveryModelDropOffModelId = json['deliveryModelDropOffModelId'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'distance': _distance,
        'PickUpModel': _pickUpModel?.toJson(),
        'est_delivery_time': _est_delivery_time?.format(),
        'DropOffModel': _dropOffModel?.toJson(),
        'status': _status,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format(),
        'deliveryModelPickUpModelId': _deliveryModelPickUpModelId,
        'deliveryModelDropOffModelId': _deliveryModelDropOffModelId
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'distance': _distance,
        'PickUpModel': _pickUpModel,
        'est_delivery_time': _est_delivery_time,
        'DropOffModel': _dropOffModel,
        'status': _status,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt,
        'deliveryModelPickUpModelId': _deliveryModelPickUpModelId,
        'deliveryModelDropOffModelId': _deliveryModelDropOffModelId
      };

  static final amplify_core.QueryModelIdentifier<DeliveryModelModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<DeliveryModelModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final DISTANCE = amplify_core.QueryField(fieldName: "distance");
  static final PICKUPMODEL = amplify_core.QueryField(
      fieldName: "PickUpModel",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'PickUpModel'));
  static final EST_DELIVERY_TIME =
      amplify_core.QueryField(fieldName: "est_delivery_time");
  static final DROPOFFMODEL = amplify_core.QueryField(
      fieldName: "DropOffModel",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'DropOffModel'));
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final DELIVERYMODELPICKUPMODELID =
      amplify_core.QueryField(fieldName: "deliveryModelPickUpModelId");
  static final DELIVERYMODELDROPOFFMODELID =
      amplify_core.QueryField(fieldName: "deliveryModelDropOffModelId");
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DeliveryModel";
    modelSchemaDefinition.pluralName = "DeliveryModels";

    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
          authStrategy: amplify_core.AuthStrategy.OWNER,
          ownerField: "owner",
          identityClaim: "cognito:username",
          provider: amplify_core.AuthRuleProvider.USERPOOLS,
          operations: const [
            amplify_core.ModelOperation.CREATE,
            amplify_core.ModelOperation.UPDATE,
            amplify_core.ModelOperation.DELETE,
            amplify_core.ModelOperation.READ
          ])
    ];

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: DeliveryModel.DISTANCE,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
        key: DeliveryModel.PICKUPMODEL,
        isRequired: false,
        ofModelName: 'PickUpModel',
        associatedKey: PickUpModel.ID));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: DeliveryModel.EST_DELIVERY_TIME,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
        key: DeliveryModel.DROPOFFMODEL,
        isRequired: false,
        ofModelName: 'DropOffModel',
        associatedKey: DropOffModel.ID));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: DeliveryModel.STATUS,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

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

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: DeliveryModel.DELIVERYMODELPICKUPMODELID,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: DeliveryModel.DELIVERYMODELDROPOFFMODELID,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));
  });
}

class _DeliveryModelModelType extends amplify_core.ModelType<DeliveryModel> {
  const _DeliveryModelModelType();

  @override
  DeliveryModel fromJson(Map<String, dynamic> jsonData) {
    return DeliveryModel.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'DeliveryModel';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [DeliveryModel] in your schema.
 */
class DeliveryModelModelIdentifier
    implements amplify_core.ModelIdentifier<DeliveryModel> {
  final String id;

  /** Create an instance of DeliveryModelModelIdentifier using [id] the primary key. */
  const DeliveryModelModelIdentifier({required this.id});

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
  String toString() => 'DeliveryModelModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is DeliveryModelModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
