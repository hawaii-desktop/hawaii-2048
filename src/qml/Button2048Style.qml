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
import QtQuick.Controls.Styles 1.0

ButtonStyle {
    property int pointSize: 18

    Palette {
        id: palette
    }

    background: Rectangle {
        id: rect
        radius: 6
        color: palette.view.background
        gradient: Gradient {
            GradientStop { position: 0; color: control.pressed ? Qt.darker(rect.color, 1.3) : Qt.lighter(rect.color, 1.3) }
            GradientStop { position: 1; color: control.pressed ? Qt.darker(rect.color, 1.1) : Qt.lighter(rect.color, 1.1) }
        }
        border.color: Qt.darker(color, 1.2)
        border.width: 1
        implicitWidth: 100
        implicitHeight: 18
    }
    label: Label {
        color: control.pressed ? Qt.lighter(palette.view.background, 1.3) : Qt.darker(palette.view.background, 1.3)
        text: control.text
        font.pointSize: pointSize
        font.bold: true
    }
}
