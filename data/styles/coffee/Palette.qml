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

QtObject {
    property var window: QtObject {
        property color background: "#faf8ef"
        property color text: "#776e65"
    }

    property var view: QtObject {
        property color background: "#bbada0"
        property color text: "#776e65"
    }

    property var cell: QtObject {
        property color background: Qt.rgba(238, 228, 218, 0.35)
        property color text: "#776e65"
    }

    property var cell2: QtObject {
        property color background: "#eee4da"
        property color text: "#776e65"
    }

    property var cell4: QtObject {
        property color background: "#ede0c8"
        property color text: "#776e65"
    }

    property var cell8: QtObject {
        property color background: "#f2b179"
        property color text: "#f9f6f2"
    }

    property var cell16: QtObject {
        property color background: "#f59563"
        property color text: "#f9f6f2"
    }

    property var cell32: QtObject {
        property color background: "#f67c5f"
        property color text: "#f9f6f2"
    }

    property var cell64: QtObject {
        property color background: "#f65e3b"
        property color text: "#f9f6f2"
    }

    property var cell128: QtObject {
        property color background: "#edcf72"
        property color text: "#f9f6f2"
    }

    property var cell256: QtObject {
        property color background: "#edcc61"
        property color text: "#f9f6f2"
    }

    property var cell512: QtObject {
        property color background: "#edc850"
        property color text: "#f9f6f2"
    }

    property var cell1024: QtObject {
        property color background: "#edc53f"
        property color text: "#f9f6f2"
    }

    property var cell2048: QtObject {
        property color background: "#edc22e"
        property color text: "#f9f6f2"
    }

    property var cellSuper: QtObject {
        property color background: "#3c3a32"
        property color text: "#f9f6f2"
    }
}
