//
//  Error+Ext
//  Networking
//
//  Created by Adriano Dias on 09/08/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Foundation
import Moya
import Domain
import Alamofire

extension Error {

    public func filter(withNetworkReachability
                        reachability: NetworkingReachability? = NetworkReachabilityManager()) -> Error {
        let genericError: InteractionError = .appFailure([.unexpected])
        if let reachability = reachability, !reachability.isReachable {
            return InteractionError.noInternetConnection(L10n.Error.Description.noInternetConnection)
        }
        if let isServerTrustEvaluationError = self.asAFError?.isServerTrustEvaluationError, isServerTrustEvaluationError {
            return InteractionError.failedRequest(L10n.Error.Description.pinnedCertificate)
        }
        return genericError
    }
}
