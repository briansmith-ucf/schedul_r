// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class ExpansionTileSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ExpansionTile'),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
          itemCount: data.length,
        ),
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Spring 2020',
    <Entry>[
      Entry('Enjoyment of Music'),
      Entry('Introduction to Philosophy'),
      Entry('Computer Science II'),
      Entry('Networks and Systems'),
      Entry('Digital Systems'),
        ],
      ),
      Entry(
    'Fall 2020',
    <Entry>[
      Entry('Processes for Object-Oriented Software Development'),
      Entry('Electronics I'),
      Entry('Computer Organization'),
      Entry('Operating Systems'),
      Entry('Computer Logic and Organization'),
        ],
      ),
      Entry(
    'Spring 2021',
    <Entry>[
      Entry('Embedded Systems'),
      Entry('Computer Architecture'),
      Entry('Computer Communication Networks'),
        ],
      ),
      Entry(
    'Fall',
    <Entry>[
      Entry('Junior Design'),
      Entry('Senior Design I'),
        ],
      ),
      Entry(
    'Spring',
    <Entry>[
      Entry('Senior Design II'),
        ],
      ),
      Entry(
    'Summer',
    <Entry>[
      Entry('Class 1'),
      Entry('Class 1'),
      Entry('Class 1'),
      Entry('Class 1'),
        ],
      ),
      Entry(
    'Fall',
    <Entry>[
      Entry('Class 1'),
      Entry('Class 1'),
      Entry('Class 1'),
      Entry('Class 1'),
        ],
      ),
      Entry(
    'Spring',
    <Entry>[
      Entry('Class 1'),
      Entry('Class 1'),
      Entry('Class 1'),
      Entry('Class 1'),
        ],
      ),
      Entry(
    'Summer',
    <Entry>[
      Entry('Class 1'),
      Entry('Class 1'),
      Entry('Class 1'),
      Entry('Class 1'),
        ],
      ),
      Entry(
    'Fall',
    <Entry>[
      Entry('Class 1'),
      Entry('Class 1'),
      Entry('Class 1'),
      Entry('Class 1'),
        ],
      ),
      Entry(
    'Spring',
    <Entry>[
      Entry('Class 1'),
      Entry('Class 1'),
      Entry('Class 1'),
      Entry('Class 1'),
        ],
      ),
      Entry(
    'Summer',
    <Entry>[
      Entry('Class 1'),
      Entry('Class 1'),
      Entry('Class 1'),
      Entry('Class 1'),
        ],
      ),

];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
