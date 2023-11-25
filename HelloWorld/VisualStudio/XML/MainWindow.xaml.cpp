// Copyright (c) Microsoft Corporation and Contributors.
// Licensed under the MIT License.

#include "pch.h"
#include "MainWindow.xaml.h"
#if __has_include("MainWindow.g.cpp")
#include "MainWindow.g.cpp"
#endif
#include "..\..\..\HelloLib\HelloLib.h"

using namespace winrt;
using namespace Microsoft::UI::Xaml;

// To learn more about WinUI, the WinUI project structure,
// and more about our project templates, see: http://aka.ms/winui-project-info.

namespace winrt::Hello_World::implementation
{
    MainWindow::MainWindow()
    {
        InitializeComponent();

        std::unique_ptr<HelloLib> helloLib = std::make_unique<HelloLib>();
        helloText().Text(winrt::to_hstring( helloLib->getHelloWorldString()) );

    }

    int32_t MainWindow::MyProperty()
    {
        throw hresult_not_implemented();
    }

    void MainWindow::MyProperty(int32_t /* value */)
    {
        throw hresult_not_implemented();
    }

}

