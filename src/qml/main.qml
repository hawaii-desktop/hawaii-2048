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
import "ui.js" as Ui

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
        anchors {
            centerIn: parent
            margins: 10 * __priv.scale
        }

        RowLayout {
            Button {
                id: newGame
                text: qsTr("New Game")
                style: Button2048Style {}
                onClicked: Logic.init()
            }

            Item {
                Layout.fillWidth: true
            }

            Rectangle {
                id: scoreRect
                radius: 6
                color: palette.view.background
                width: 100
                height: 80

                ColumnLayout {
                    anchors {
                        fill: parent
                        margins: 4
                    }

                    Label {
                        text: qsTr("Score")
                        color: Qt.lighter(palette.view.text, 1.9)
                        font.pointSize: 12
                        font.bold: true
                        font.capitalization: Font.AllUppercase

                        Layout.alignment: Qt.AlignHCenter
                    }

                    Label {
                        id: scoreLabel
                        color: Qt.lighter(palette.view.background, 1.5)
                        font.pointSize: 14
                        font.bold: true

                        Layout.alignment: Qt.AlignHCenter
                    }
                }
            }

            Rectangle {
                id: bestRect
                radius: 6
                color: palette.view.background
                width: 120
                height: 80

                ColumnLayout {
                    anchors {
                        fill: parent
                        margins: 4
                    }

                    Label {
                        text: qsTr("Best")
                        color: Qt.lighter(palette.view.text, 1.9)
                        font.pointSize: 12
                        font.bold: true
                        font.capitalization: Font.AllUppercase

                        Layout.alignment: Qt.AlignHCenter
                    }

                    Label {
                        id: bestLabel
                        color: Qt.lighter(palette.view.background, 1.5)
                        font.pointSize: 14
                        font.bold: true

                        Layout.alignment: Qt.AlignHCenter
                    }
                }
            }

            Layout.fillWidth: true
            Layout.fillHeight: true
        }

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
            style: ProgressBar2048Style {}

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: playground.Layout.preferredWidth
        }

        RowLayout {
            Label {
                id: levelLabel
            }

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

        Logic.initDb();
        newGame.clicked();
    }
}
