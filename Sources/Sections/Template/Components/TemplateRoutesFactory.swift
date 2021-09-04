//  TemplateChildViewsFactory.swift
//  Created by Václav Brož on 12/8/2021

import Swinject

struct TemplateChildViewsFactory {
    let assembler: Assembler
}

extension TemplateChildViewsFactory: TemplateChildViewsFactorable {}
