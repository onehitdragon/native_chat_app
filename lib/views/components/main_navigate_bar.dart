import 'package:flutter/material.dart';

class MainNavigateBar extends StatefulWidget{
  const MainNavigateBar({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _MainNavigateState();
  }
}

class _MainNavigateState extends State<MainNavigateBar>{
  final Map<String, bool> _isHovers = {};

  @override
  void initState() {
    super.initState();
    _isHovers["Chats"] = true;
    _isHovers["Contact"] = false;
    _isHovers["Call"] = false;
    _isHovers["Settings"] = false;
  }

  void onNavigate(String label){
    setState(() {
      _isHovers.forEach((key, value) {
        _isHovers[key] = false;
      });
      _isHovers[label] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(80, 255, 255, 255),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: NavigationBar(
        backgroundColor: Colors.transparent,
        destinations: [
          ButtonNavigate(Icons.message_outlined, "Chats", _isHovers["Chats"]!, onNavigate),
          ButtonNavigate(Icons.category_outlined, "Contact", _isHovers["Contact"]!, onNavigate),
          ButtonNavigate(Icons.call_end_outlined, "Call", _isHovers["Call"]!, onNavigate),
          ButtonNavigate(Icons.settings_outlined, "Settings", _isHovers["Settings"]!, onNavigate)
        ]
      )
    );
  }
}

class ButtonNavigate extends StatelessWidget{
  final IconData _iconData;
  final String _label;
  final bool _isHover;
  final Function(String label) _onTap;

  const ButtonNavigate(this._iconData, this._label, this._isHover, this._onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTap(_label);
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.only(top: 2, bottom: 2),
        decoration: BoxDecoration(
          color: _isHover ? Colors.black : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: Icon(
                _iconData,
                color: _isHover ? Colors.white : Colors.black,
                size: 20,
              ),
            ),
            Visibility(
              visible: _isHover,
              child: Text(
                _label,
                style: const TextStyle(
                  color: Colors.white
                ),
              )
            )
          ]
        )
      )
    );
  }
}