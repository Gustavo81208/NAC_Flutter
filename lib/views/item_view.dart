import 'package:flutter/material.dart';
import 'package:nac3_flutter/stores/items_store.dart';
import 'package:nac3_flutter/model/escritor.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ItemsView extends StatefulWidget {
  final Escritor escritor;

  const ItemsView({Key key, this.escritor}) : super(key: key);

  @override
  _ItemsViewState createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  late List<Escritor> items;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text("${widget.escritor.total.toStringAsFixed(2)}");
        }),
      ),
      body: Observer(
        builder: (_) {
          final items = widget.escritor.selectedItems;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              separatorBuilder: (_, index) => const SizedBox(height: 10),
              itemCount: items.length,
              itemBuilder: (_, int index) {
                final item = items[index];
                return Observer(
                  builder: (_) {
                    return Dismissible(
                      onDismissed: (direction) {
                        widget.escritor.remove(item);
                      },
                      key: UniqueKey(),
                      child: Container(
                        height: 180,
                        padding: const EdgeInsets.only(bottom: 30, top: 30),
                        color: Colors.orange[130],
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              height: 98,
                              width: 98,
                              color: Colors.blueAccent,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Nome: ${item.product.name}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        item.decrement();
                                      },
                                    ),
                                    Text("${item.quantity}"),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        item.increment();
                                      },
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
