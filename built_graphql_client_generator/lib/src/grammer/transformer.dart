

import 'package:built_graphql_client_generator/src/ast/index.dart';

class GrammarTransformer {

  List<ItemType> as_list<ItemType>(Object value) {
    List<ItemType> items = [];
    if(value is List) {
      items.addAll(_items<ItemType>(value));
    }
    return items;
  }

  ValueType as_value<ValueType>(Object value, [ValueType defaultValue]) {
    if(value is ValueType) {
      return value;
    }
    if(value is ValueNode<ValueType>){
      return value.value;
    }
    if(value is List) {
      return _item<ValueType>(value) ?? defaultValue;
    }
    return defaultValue;
  }

  String as_name(Object value, [String defaultValue = ""]) {
    if(value is NameNode) {
      return value.name;
    }
    if(value is List) {
      return _item<NameNode>(value)?.name ?? defaultValue;
    }
    return defaultValue;
  }

  ItemType _item<ItemType>(List list)  {
    for(ItemType item in _items(list)) {
      return item;
    }
    return null;
  }

  Iterable<ItemType> _items<ItemType>(List list) sync* {
    for(Object item in list) {
      if(item is ItemType) {
        yield item;
      } else if (item is List) {
        yield* _items(item);
      }
    }
  }
}