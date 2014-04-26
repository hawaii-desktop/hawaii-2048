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

import QtQuick 2.0
import QtQuick.Controls 1.0
import "ui.js" as Ui

Item {
    id: item

    property int spacing
    property alias value: label.text

    Palette {
        id: palette
    }

    Rectangle {
        id: rect
        anchors.fill: parent
        anchors.margins: spacing
        color: item.value == "" ? palette.cell.background : palette["cell" + item.value].background
        radius: 6

        Label {
            id: label
            anchors.centerIn: parent
            color: item.value == "" ? palette.cell.text : palette["cell" + item.value].text
            font.bold: true
            font.pointSize: text != "" ? Ui.calculatePointSize(rect, text) : 10
        }
    }
}
