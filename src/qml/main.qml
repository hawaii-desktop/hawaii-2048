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
import QtQuick.Window 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.LocalStorage 2.0
import "logic.js" as Logic

Window {
    id: window
    title: "Hawaii 2048"
    minimumWidth: 640
    minimumHeight: 480
    color: palette.window.background
    visible: true

    QtObject {
        id: __priv

        property real size: 100
        property real scale: Math.min(window.width * 0.56 / size, window.height * 0.56 / size);
        onScaleChanged: console.debug("Scale:", scale)
    }

    Palette {
        id: palette
    }

    ColumnLayout {
        id: mainLayout
        anchors.fill: parent

        Playground {
            id: playground
            focus: enabled

            Keys.onUpPressed: Logic.moveGrid(1)
            Keys.onRightPressed: Logic.moveGrid(2)
            Keys.onLeftPressed: Logic.moveGrid(3)
            Keys.onDownPressed: Logic.moveGrid(4)

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: __priv.size * __priv.scale
            Layout.preferredHeight: __priv.size * __priv.scale
        }

        ProgressBar {
            id: progressBar
            minimumValue: 0
            maximumValue: 1

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: playground.Layout.preferredWidth
        }

        RowLayout {
            Label {
                id: levelLabel
            }

            Label {
                id: scoreLabel
            }

            Layout.alignment: Qt.AlignCenter
        }

        Label {
            id: bestLabel

            Layout.alignment: Qt.AlignCenter
        }

        Label {
            id: shareLabel

            Layout.alignment: Qt.AlignCenter
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

    Component.onCompleted: {
        Logic.gridElem = playground.gridView;
        Logic.scoreElem = scoreLabel;
        Logic.levelText = levelLabel;
        Logic.levelBar = progressBar;
        Logic.bestElem = bestLabel;
        Logic.shareElem = shareLabel

        Logic.initGrid();
        Logic.initDb();
        Logic.initBest();
    }
}
