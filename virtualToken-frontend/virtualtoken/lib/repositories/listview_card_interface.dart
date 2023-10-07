import 'package:flutter/material.dart';

/// The base class for the different types of items the list can contain.
/// Will be used on ListView.builder widget
abstract class ListViewCard {
  Widget buildLeading(BuildContext context);

  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);

  Widget buildTrailing(BuildContext context);
}
