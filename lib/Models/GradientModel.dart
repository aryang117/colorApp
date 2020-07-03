class GradientModel {
  int _red;
  int _green;
  int _blue;
  int _index;

  GradientModel(this._red, this._green, this._blue, this._index);

//setters

  set index(int index) {
    this._index = index;
  }


  set red(int red) {
    this._red = red;
  }

  set green(int green) {
    this._green = green;
  }

  set blue(int blue) {
    this._blue = blue;
  }

//getters

  int get index => this._index;

  int get red => this._red;
  int get green => this._green;
  int get blue => this._blue;
}
