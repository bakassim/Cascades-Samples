/* Copyright (c) 2012 Research In Motion Limited.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import bb.cascades 1.0
import bb.cascades.pickers 1.0

Page {
    titleBar: TitleBar {
        title: qsTr ("File Picker")
    }

    Container {
        layout: DockLayout {}

        // The background image
        ImageView {
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill

            imageSource: "asset:///images/background.png"
        }

        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill

            topPadding: 50
            leftPadding: 30
            rightPadding: 30

//! [0]
            // The file picker mode selector
            DropDown {
                id: pickerMode

                horizontalAlignment: HorizontalAlignment.Center
                topMargin: 50

                title: qsTr ("Mode")

                Option {
                    text: qsTr ("Picker")
                    value: FilePickerMode.Picker
                    selected: true
                }

                Option {
                    text: qsTr ("Saver")
                    value: FilePickerMode.Saver
                }

                Option {
                    text: qsTr ("PickerMultiple")
                    value: FilePickerMode.PickerMultiple
                }

                Option {
                    text: qsTr ("SaverMultiple")
                    value: FilePickerMode.SaverMultiple
                }
            }
//! [0]

            // The file picker type selector
            DropDown {
                id: pickerType

                horizontalAlignment: HorizontalAlignment.Center

                title: qsTr ("Type")

                Option {
                    text: qsTr ("Picture")
                    value: FileType.Picture
                }

                Option {
                    text: qsTr ("Document")
                    value: FileType.Document
                }

                Option {
                    text: qsTr ("Music")
                    value: FileType.Music
                }

                Option {
                    text: qsTr ("Video")
                    value: FileType.Video
                }

                Option {
                    text: qsTr ("Other")
                    value: FileType.Other
                    selected: true
                }
            }

            // The file picker view mode selector
            DropDown {
                id: pickerViewMode

                horizontalAlignment: HorizontalAlignment.Center

                title: qsTr ("View Mode")

                Option {
                    text: qsTr ("Default")
                    value: ViewMode.Default
                    selected: true
                }

                Option {
                    text: qsTr ("List View")
                    value: ViewMode.ListView
                }

                Option {
                    text: qsTr ("Grid View")
                    value: ViewMode.GridView
                }
            }

            // The file picker sort criterion selector
            DropDown {
                id: pickerSortBy

                horizontalAlignment: HorizontalAlignment.Center

                title: qsTr ("Sort by")

                Option {
                    text: qsTr ("Default")
                    value: FilePickerSortFlag.Default
                    selected: true
                }

                Option {
                    text: qsTr ("Name")
                    value: FilePickerSortFlag.Name
                }

                Option {
                    text: qsTr ("Date")
                    value: FilePickerSortFlag.Date
                }

                Option {
                    text: qsTr ("Suffix")
                    value: FilePickerSortFlag.Suffix
                }

                Option {
                    text: qsTr ("Size")
                    value: FilePickerSortFlag.Size
                }
            }

            // The file picker sort order selector
            DropDown {
                id: pickerSortOrder

                horizontalAlignment: HorizontalAlignment.Center

                title: qsTr ("Sort order")

                Option {
                    text: qsTr ("Default")
                    value: FilePickerSortOrder.Default
                    selected: true
                }

                Option {
                    text: qsTr ("Ascending")
                    value: FilePickerSortOrder.Ascending
                }

                Option {
                    text: qsTr ("Descending")
                    value: FilePickerSortOrder.Descending
                }
            }

//! [1]
            // The 'Show' button
            Button {
                horizontalAlignment: HorizontalAlignment.Center
                topMargin: 100

                text: qsTr ("Show")
                onClicked: picker.open()
            }
//! [1]

//! [2]
            // The result label
            Label {
                id: resultLabel

                horizontalAlignment: HorizontalAlignment.Center
                topMargin: 30

                text: qsTr ("Selected file: %1").arg(picker.selectedFile)

                textStyle {
                    base: SystemDefaults.TextStyles.BodyText
                    color: Color.White
                }

                multiline: true
                visible: (picker.selectedFile != "")
            }
//! [2]
        }
    }

//! [3]
    attachedObjects: [
        FilePicker {
            id: picker

            property string selectedFile

            title: qsTr ("File Picker")
            mode: pickerMode.selectedValue
            type: pickerType.selectedValue
            viewMode: pickerViewMode.selectedValue
            sortBy: pickerSortBy.selectedValue
            sortOrder: pickerSortOrder.selectedValue

            onFileSelected: {
                selectedFile = selectedFiles[0]
            }
        }
    ]
//! [3]
}
