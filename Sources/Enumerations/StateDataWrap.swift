//  StateDataWrap.swift
//  Created by Václav Brož on 4/9/2021

import SwiftUI

enum StateDataWrap<WrappedData, LoadingData, FailureData, BlankData> {
    // MARK: - Cases -
    case full(WrappedData)
    case loading(LoadingData)
    case failure(FailureData)
    case blank(BlankData)

    // MARK: - Methods -
    // swiftlint:disable line_length
    @ViewBuilder func mapToView<DataView, LoadingView, FailureView, BlankView>(_ dataView: (WrappedData) -> DataView,
                                                                               loadingView: (LoadingData) -> LoadingView,
                                                                               failureView: (FailureData) -> FailureView,
                                                                               blankView: (BlankData) -> BlankView
    ) -> some View where DataView: View, LoadingView: View, FailureView: View, BlankView: View {
        switch self {
        case .full(let wrappedData):
            dataView(wrappedData)
        case .loading(let loadingData):
            loadingView(loadingData)
        case .failure(let failureData):
            failureView(failureData)
        case .blank(let blankData):
            blankView(blankData)
        }
    }
    // swiftlint:enable line_length

    // MARK: - Computed Properties -
    var wrappedData: WrappedData? {
        switch self {
        case .full(let data):
            return data
        default:
            return nil
        }
    }

    var isLoading: Bool {
        switch self {
        case .loading:
            return true
        default:
            return false
        }
    }

    var hasFailureOccured: Bool {
        switch self {
        case .failure:
            return true
        default:
            return false
        }
    }

    var isBlank: Bool {
        switch self {
        case .blank:
            return true
        default:
            return false
        }
    }
}

extension StateDataWrap where LoadingData == Never {
    @ViewBuilder func mapToView<DataView, FailureView, BlankView>(_ dataView: (WrappedData) -> DataView,
                                                                  failureView: (FailureData) -> FailureView,
                                                                  blankView: (BlankData) -> BlankView
    ) -> some View where DataView: View, FailureView: View, BlankView: View {
        switch self {
        case .full(let wrappedData):
            dataView(wrappedData)
        case .failure(let failureData):
            failureView(failureData)
        case .blank(let blankData):
            blankView(blankData)
        }
    }
}

extension StateDataWrap where FailureData == Never {
    @ViewBuilder func mapToView<DataView, LoadingView, BlankView>(_ dataView: (WrappedData) -> DataView,
                                                                  loadingView: (LoadingData) -> LoadingView,
                                                                  blankView: (BlankData) -> BlankView
    ) -> some View where DataView: View, LoadingView: View, BlankView: View {
        switch self {
        case .full(let wrappedData):
            dataView(wrappedData)
        case .loading(let loadingData):
            loadingView(loadingData)
        case .blank(let blankData):
            blankView(blankData)
        }
    }
}

extension StateDataWrap where BlankData == Never {
    @ViewBuilder func mapToView<DataView, LoadingView, FailureView>(_ dataView: (WrappedData) -> DataView,
                                                                    loadingView: (LoadingData) -> LoadingView,
                                                                    failureView: (FailureData) -> FailureView
    ) -> some View where DataView: View, LoadingView: View, FailureView: View {
        switch self {
        case .full(let wrappedData):
            dataView(wrappedData)
        case .loading(let loadingData):
            loadingView(loadingData)
        case .failure(let failureData):
            failureView(failureData)
        }
    }
}

extension StateDataWrap where LoadingData == Never, FailureData == Never {
    @ViewBuilder func mapToView<DataView, BlankView>(_ dataView: (WrappedData) -> DataView,
                                                     blankView: (BlankData) -> BlankView
    ) -> some View where DataView: View, BlankView: View {
        switch self {
        case .full(let wrappedData):
            dataView(wrappedData)
        case .blank(let blankData):
            blankView(blankData)
        }
    }
}

extension StateDataWrap where LoadingData == Never, BlankData == Never {
    @ViewBuilder func mapToView<DataView, FailureView>(_ dataView: (WrappedData) -> DataView,
                                                       failureView: (FailureData) -> FailureView
    ) -> some View where DataView: View, FailureView: View {
        switch self {
        case .full(let wrappedData):
            dataView(wrappedData)
        case .failure(let failureData):
            failureView(failureData)
        }
    }
}

extension StateDataWrap where FailureData == Never, BlankData == Never {
    @ViewBuilder func mapToView<DataView, LoadingView>(_ dataView: (WrappedData) -> DataView,
                                                       loadingView: (LoadingData) -> LoadingView
    ) -> some View where DataView: View, LoadingView: View {
        switch self {
        case .full(let wrappedData):
            dataView(wrappedData)
        case .loading(let loadingData):
            loadingView(loadingData)
        }
    }
}
