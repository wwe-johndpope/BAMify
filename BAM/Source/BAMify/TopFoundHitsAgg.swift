// Generated from graphql_swift_gen gem
import Foundation

extension BAMify {
	open class TopFoundHitsAggQuery: GraphQL.AbstractQuery, GraphQLQuery {
		public typealias Response = TopFoundHitsAgg

		@discardableResult
		open func field(aliasSuffix: String? = nil) -> TopFoundHitsAggQuery {
			addField(field: "field", aliasSuffix: aliasSuffix)
			return self
		}

		@discardableResult
		open func buckets(aliasSuffix: String? = nil, _ subfields: (TopFoundHitsBucketQuery) -> Void) -> TopFoundHitsAggQuery {
			let subquery = TopFoundHitsBucketQuery()
			subfields(subquery)

			addField(field: "buckets", aliasSuffix: aliasSuffix, subfields: subquery)
			return self
		}
	}

	open class TopFoundHitsAgg: GraphQL.AbstractResponse, GraphQLObject {
		public typealias Query = TopFoundHitsAggQuery

		open override func deserializeValue(fieldName: String, value: Any) throws -> Any? {
			let fieldValue = value
			switch fieldName {
				case "field":
				if value is NSNull { return nil }
				guard let value = value as? String else {
					throw SchemaViolationError(type: TopFoundHitsAgg.self, field: fieldName, value: fieldValue)
				}
				return value

				case "buckets":
				if value is NSNull { return nil }
				guard let value = value as? [Any] else {
					throw SchemaViolationError(type: TopFoundHitsAgg.self, field: fieldName, value: fieldValue)
				}
				return try value.map { if $0 is NSNull { return nil }
				guard let value = $0 as? [String: Any] else {
					throw SchemaViolationError(type: TopFoundHitsAgg.self, field: fieldName, value: fieldValue)
				}
				return try TopFoundHitsBucket(fields: value) } as [Any?]

				default:
				throw SchemaViolationError(type: TopFoundHitsAgg.self, field: fieldName, value: fieldValue)
			}
		}

		open var typeName: String { return "TopFoundHitsAgg" }

		open var field: String? {
			return internalGetField()
		}

		func internalGetField(aliasSuffix: String? = nil) -> String? {
			return field(field: "field", aliasSuffix: aliasSuffix) as! String?
		}

		open var buckets: [BAMify.TopFoundHitsBucket?]? {
			return internalGetBuckets()
		}

		func internalGetBuckets(aliasSuffix: String? = nil) -> [BAMify.TopFoundHitsBucket?]? {
			return field(field: "buckets", aliasSuffix: aliasSuffix) as! [BAMify.TopFoundHitsBucket?]?
		}

		override open func childObjectType(key: String) -> GraphQL.ChildObjectType {
			switch(key) {
				case "field":

				return .scalar

				case "buckets":

				return .objectList

				default:
				return .scalar
			}
		}

		override open func fetchChildObject(key: String) -> GraphQL.AbstractResponse? {
			switch(key) {
				default:
				break
			}
			return nil
		}

		override open func fetchChildObjectList(key: String) -> [GraphQL.AbstractResponse] {
			switch(key) {
				case "buckets":
				return internalGetBuckets() ?? []

				default:
				return []
			}
		}

		open func childResponseObjectMap() -> [GraphQL.AbstractResponse]  {
			return []
		}

		open func responseObject() -> GraphQL.AbstractResponse {
			return self as GraphQL.AbstractResponse
		}
	}
}
