/****************************************************************************
 * This file is part of Hawaii 2048.
 *
 * Copyright (C) 2014 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * Author(s):
 *    Pier Luigi Fiorini
 *
 * $BEGIN_LICENSE:GPL2+$
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * $END_LICENSE$
 ***************************************************************************/

function calculatePointSize(parent, text) {
    var minPointSize = 14;

    var i;
    for (i = minPointSize; i <= 200; i++) {
        var code = 'import QtQuick 2.0; Text { font.bold: true; font.pointSize: ' + i + '; text: "' + text + '"; visible: false }';
        var textElement = Qt.createQmlObject(code, parent, "calculatePointSize");

        var width = textElement.width;
        var height = textElement.height;

        textElement.destroy();

        if (textElement.width > parent.width * 0.9 || textElement.height > parent.height * 0.9)
            return i - 1;
    }

    return minPointSize;
}
