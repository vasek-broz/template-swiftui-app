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
    func mapToView<DataView, LoadingView, FailureView, BlankView>(_ dataView: (WrappedData) -> DataView,
                                                                  loadingView: (LoadingData) -> LoadingView,
                                                                  failureView: (FailureData) -> FailureView,
                                                                  blankView: (BlankData) -> BlankView
    ) -> AnyView where DataView: View, LoadingView: View, FailureView: View, BlankView: View {
        switch self {
        case .full(let wrappedData):
            return AnyView(dataView(wrappedData))
        case .loading(let loadingData):
            return AnyView(loadingView(loadingData))
        case .failure(let failureData):
            return AnyView(failureView(failureData))
        case .blank(let blankData):
            return AnyView(blankView(blankData))
        }
    }
    
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
    func mapToView<DataView, FailureView, BlankView>(_ dataView: (WrappedData) -> DataView,
                                                     failureView: (FailureData) -> FailureView,
                                                     blankView: (BlankData) -> BlankView
    ) -> AnyView where DataView: View, FailureView: View, BlankView: View {
        switch self {
        case .full(let wrappedData):
            return AnyView(dataView(wrappedData))
        case .loading:
            return AnyView(EmptyView())
        case .failure(let failureData):
            return AnyView(failureView(failureData))
        case .blank(let blankData):
            return AnyView(blankView(blankData))
        }
    }
}

extension StateDataWrap where FailureData == Never {
    func mapToView<DataView, LoadingView, BlankView>(_ dataView: (WrappedData) -> DataView,
                                                     loadingView: (LoadingData) -> LoadingView,
                                                     blankView: (BlankData) -> BlankView
    ) -> AnyView where DataView: View, LoadingView: View, BlankView: View {
        switch self {
        case .full(let wrappedData):
            return AnyView(dataView(wrappedData))
        case .loading(let loadingData):
            return AnyView(loadingView(loadingData))
        case .failure:
            return AnyView(EmptyView())
        case .blank(let blankData):
            return AnyView(blankView(blankData))
        }
    }
}

extension StateDataWrap where BlankData == Never {
    func mapToView<DataView, LoadingView, FailureView>(_ dataView: (WrappedData) -> DataView,
                                                       loadingView: (LoadingData) -> LoadingView,
                                                       failureView: (FailureData) -> FailureView
    ) -> AnyView where DataView: View, LoadingView: View, FailureView: View {
        switch self {
        case .full(let wrappedData):
            return AnyView(dataView(wrappedData))
        case .loading(let loadingData):
            return AnyView(loadingView(loadingData))
        case .failure(let failureData):
            return AnyView(failureView(failureData))
        case .blank:
            return AnyView(EmptyView())
        }
    }
}

extension StateDataWrap where LoadingData == Never, FailureData == Never {
    func mapToView<DataView, BlankView>(_ dataView: (WrappedData) -> DataView,
                                        blankView: (BlankData) -> BlankView) -> AnyView where DataView: View, BlankView: View {
        switch self {
        case .full(let wrappedData):
            return AnyView(dataView(wrappedData))
        case .blank(let blankData):
            return AnyView(blankView(blankData))
        default:
            return AnyView(EmptyView())
        }
    }
}

extension StateDataWrap where LoadingData == Never, BlankData == Never {
    func mapToView<DataView, FailureView>(_ dataView: (WrappedData) -> DataView,
                                          failureView: (FailureData) -> FailureView) -> AnyView where DataView: View, FailureView: View {
        switch self {
        case .full(let wrappedData):
            return AnyView(dataView(wrappedData))
        case .failure(let failureData):
            return AnyView(failureView(failureData))
        default:
            return AnyView(EmptyView())
        }
    }
}

extension StateDataWrap where FailureData == Never, BlankData == Never {
    func mapToView<DataView, LoadingView>(_ dataView: (WrappedData) -> DataView,
                                                     loadingView: (LoadingData) -> LoadingView) -> AnyView where DataView: View, LoadingView: View {
        switch self {
        case .full(let wrappedData):
            return AnyView(dataView(wrappedData))
        case .loading(let loadingData):
            return AnyView(loadingView(loadingData))
        default:
            return AnyView(EmptyView())
        }
    }
}
