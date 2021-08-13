//  DefaultTemplateRouter.swift
//  Created by Václav Brož on 12/8/2021

import Swinject

struct DefaultTemplateRouter {
    let assembler: Assembler
}

extension DefaultTemplateRouter: TemplateRoutable {}
