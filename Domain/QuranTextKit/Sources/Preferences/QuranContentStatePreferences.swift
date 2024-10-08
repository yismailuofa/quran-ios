//
//  QuranContentStatePreferences.swift
//
//
//  Created by Mohamed Afifi on 2021-11-24.
//

import Preferences
import QuranText

public struct QuranContentStatePreferences {
    // MARK: Lifecycle

    private init() {}

    // MARK: Public

    public static let shared = QuranContentStatePreferences()

    @TransformedPreference(showQuranTranslationView, transformer: quranModeTransfomer)
    public var quranMode: QuranMode

    @Preference(twoPagesEnabled)
    public var twoPagesEnabled: Bool

    @Preference(verticalScrollingEnabled)
    public var verticalScrollingEnabled: Bool

    // MARK: Private

    private static let showQuranTranslationView = PreferenceKey<Bool>(key: "showQuranTranslationView", defaultValue: false)
    private static let twoPagesEnabled = PreferenceKey<Bool>(key: "twoPagesEnabled", defaultValue: TwoPagesUtils.settingDefaultValue)
    private static let verticalScrollingEnabled = PreferenceKey<Bool>(key: "verticalScrollingEnabled", defaultValue: false)

    private static let quranModeTransfomer = PreferenceTransformer<Bool, QuranMode>(
        rawToValue: { $0 ? .translation : .arabic },
        valueToRaw: { $0 == .translation }
    )
}
