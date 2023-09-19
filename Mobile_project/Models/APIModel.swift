// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let countryList = try? JSONDecoder().decode(CountryList.self, from: jsonData)

/*import Foundation

struct GamePlan: Decodable {
    var results: [Element]
}

struct Element: Decodable {
    var name: Name
    var flags: Flags
    var region: String
}
*/
//struct ModelMapper {
//    static func map(element: CountryListElement) -> GamePlan.Result {
//        return .init(name: element.name.common, flags: element.flags.png, region: element.region)
//    }
//}

//struct ModelMapper {
   // static func map(element: CountryListElement) -> GamePlan.Result {
       // let defaultFlagsURL = URL(string: "https://flagcdn.com/w320/ht.png")!
        //let flagsURL = URL(string: element.flags.png) ?? defaultFlagsURL
       // return GamePlan.Result(name: element.name.common, flags: flagsURL, region: element.region)
        //}
    //}

// MARK: - CountryListElement
/*struct CountryListElement: Codable {
    let name: Name
    let tld: [String]?
    let cca2: String?
    let ccn3: String?
    let cca3: String?
    let cioc: String?
    let independent: Bool?
    let status: Status
    let unMember: Bool
    let currencies: Currencies?
    let idd: Idd
    let capital: [String]?
    let altSpellings: [String]
    let region: String
    let subregion: String?
    let languages: [String: String]?
    let translations: [String: Translation]
    let latlng: [Double]
    let landlocked: Bool
    let borders: [String]?
    let area: Double
    let demonyms: Demonyms?
    let flag: String
    let maps: Maps
    let population: Int
    let gini: [String: Double]?
    let fifa: String?
    let car: Car
    let timezones: [String]
    let continents: [Continent]
    let flags: Flags
    let coatOfArms: CoatOfArms
    let startOfWeek: StartOfWeek
    let capitalInfo: CapitalInfo
    let postalCode: PostalCode?
}

// MARK: - CapitalInfo
struct CapitalInfo: Codable {
    let latlng: [Double]?
}

// MARK: - Car
struct Car: Codable {
    let signs: [String]?
    let side: Side
}

enum Side: String, Codable {
    case sideLeft = "left"
    case sideRight = "right"
}

// MARK: - CoatOfArms
struct CoatOfArms: Codable {
    let png: String?
    let svg: String?
}

enum Continent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

// MARK: - Currencies
struct Currencies: Codable {
    let mru, ern, usd, ron: Aed?
    let xcd, aud, cop, clp: Aed?
    let ghs, gip, ves, eur: Aed?
    let bwp, tzs, kmf, xof: Aed?
    let cve, lsl, zar, xaf: Aed?
    let jod, sek, vnd, qar: Aed?
    let brl, gel, krw, stn: Aed?
    let gyd, srd, khr, ang: Aed?
    let mvr, pyg, pen, fkp: Aed?
    let uzs, egp, ils, kzt: Aed?
    let myr, aed, czk, yer: Aed?
    let mmk, xpf, fjd, all: Aed?
    let gbp, imp, afn, kgs: Aed?
    let php, rsd, shp, mdl: Aed?
    let hkd, pkr, sar, aoa: Aed?
    let dkk, kwd, chf, top: Aed?
    let gtq, ugx, gnf, npr: Aed?
    let etb, kid, pgk, isk: Aed?
    let mad, iqd, dop, sll: Aed?
    let bzd, btn, inr, irr: Aed?
    let bob, currenciesTRY, fok, nio: Aed?
    let cdf, azn, sgd, cuc: Aed?
    let cup, bdt, huf, bgn: Aed?
    let scr, mop, mxn, bnd: Aed?
    let twd, awg, ttd, vuv: Aed?
    let dzd, ckd, nzd, bif: Aed?
    let byn, kpw, wst, zwl: Aed?
    let bmd, djf, jpy, tvd: Aed?
    let sdg: BAM?
    let mkd, cad, idr, gmd: Aed?
    let sos, mur, rub, omr: Aed?
    let mnt, tjs, sbd, htg: Aed?
    let hnl, nad, ars, uyu: Aed?
    let bbd, ggp, kes, jmd: Aed?
    let tnd, kyd, mzn, lrd: Aed?
    let ssp, lyd, tmt, ngn: Aed?
    let nok: Aed?
    let bam: BAM?
    let lak, mga, lkr, rwf: Aed?
    let amd, syp, thb, uah: Aed?
    let cny, mwk, pab, bhd: Aed?
    let jep, pln, bsd, crc: Aed?
    let lbp, zmw, szl: Aed?

    enum CodingKeys: String, CodingKey {
        case mru = "MRU"
        case ern = "ERN"
        case usd = "USD"
        case ron = "RON"
        case xcd = "XCD"
        case aud = "AUD"
        case cop = "COP"
        case clp = "CLP"
        case ghs = "GHS"
        case gip = "GIP"
        case ves = "VES"
        case eur = "EUR"
        case bwp = "BWP"
        case tzs = "TZS"
        case kmf = "KMF"
        case xof = "XOF"
        case cve = "CVE"
        case lsl = "LSL"
        case zar = "ZAR"
        case xaf = "XAF"
        case jod = "JOD"
        case sek = "SEK"
        case vnd = "VND"
        case qar = "QAR"
        case brl = "BRL"
        case gel = "GEL"
        case krw = "KRW"
        case stn = "STN"
        case gyd = "GYD"
        case srd = "SRD"
        case khr = "KHR"
        case ang = "ANG"
        case mvr = "MVR"
        case pyg = "PYG"
        case pen = "PEN"
        case fkp = "FKP"
        case uzs = "UZS"
        case egp = "EGP"
        case ils = "ILS"
        case kzt = "KZT"
        case myr = "MYR"
        case aed = "AED"
        case czk = "CZK"
        case yer = "YER"
        case mmk = "MMK"
        case xpf = "XPF"
        case fjd = "FJD"
        case all = "ALL"
        case gbp = "GBP"
        case imp = "IMP"
        case afn = "AFN"
        case kgs = "KGS"
        case php = "PHP"
        case rsd = "RSD"
        case shp = "SHP"
        case mdl = "MDL"
        case hkd = "HKD"
        case pkr = "PKR"
        case sar = "SAR"
        case aoa = "AOA"
        case dkk = "DKK"
        case kwd = "KWD"
        case chf = "CHF"
        case top = "TOP"
        case gtq = "GTQ"
        case ugx = "UGX"
        case gnf = "GNF"
        case npr = "NPR"
        case etb = "ETB"
        case kid = "KID"
        case pgk = "PGK"
        case isk = "ISK"
        case mad = "MAD"
        case iqd = "IQD"
        case dop = "DOP"
        case sll = "SLL"
        case bzd = "BZD"
        case btn = "BTN"
        case inr = "INR"
        case irr = "IRR"
        case bob = "BOB"
        case currenciesTRY = "TRY"
        case fok = "FOK"
        case nio = "NIO"
        case cdf = "CDF"
        case azn = "AZN"
        case sgd = "SGD"
        case cuc = "CUC"
        case cup = "CUP"
        case bdt = "BDT"
        case huf = "HUF"
        case bgn = "BGN"
        case scr = "SCR"
        case mop = "MOP"
        case mxn = "MXN"
        case bnd = "BND"
        case twd = "TWD"
        case awg = "AWG"
        case ttd = "TTD"
        case vuv = "VUV"
        case dzd = "DZD"
        case ckd = "CKD"
        case nzd = "NZD"
        case bif = "BIF"
        case byn = "BYN"
        case kpw = "KPW"
        case wst = "WST"
        case zwl = "ZWL"
        case bmd = "BMD"
        case djf = "DJF"
        case jpy = "JPY"
        case tvd = "TVD"
        case sdg = "SDG"
        case mkd = "MKD"
        case cad = "CAD"
        case idr = "IDR"
        case gmd = "GMD"
        case sos = "SOS"
        case mur = "MUR"
        case rub = "RUB"
        case omr = "OMR"
        case mnt = "MNT"
        case tjs = "TJS"
        case sbd = "SBD"
        case htg = "HTG"
        case hnl = "HNL"
        case nad = "NAD"
        case ars = "ARS"
        case uyu = "UYU"
        case bbd = "BBD"
        case ggp = "GGP"
        case kes = "KES"
        case jmd = "JMD"
        case tnd = "TND"
        case kyd = "KYD"
        case mzn = "MZN"
        case lrd = "LRD"
        case ssp = "SSP"
        case lyd = "LYD"
        case tmt = "TMT"
        case ngn = "NGN"
        case nok = "NOK"
        case bam = "BAM"
        case lak = "LAK"
        case mga = "MGA"
        case lkr = "LKR"
        case rwf = "RWF"
        case amd = "AMD"
        case syp = "SYP"
        case thb = "THB"
        case uah = "UAH"
        case cny = "CNY"
        case mwk = "MWK"
        case pab = "PAB"
        case bhd = "BHD"
        case jep = "JEP"
        case pln = "PLN"
        case bsd = "BSD"
        case crc = "CRC"
        case lbp = "LBP"
        case zmw = "ZMW"
        case szl = "SZL"
    }
}

// MARK: - Aed
struct Aed: Codable {
    let name, symbol: String
}

// MARK: - BAM
struct BAM: Codable {
    let name: String
}

// MARK: - Demonyms
struct Demonyms: Codable {
    let eng: Eng
    let fra: Eng?
}

// MARK: - Eng
struct Eng: Codable {
    let f, m: String
}

// MARK: - Flags
struct Flags: Codable {
    let png: String
    let svg: String
    let alt: String?
}

// MARK: - Idd
struct Idd: Codable {
    let root: String?
    let suffixes: [String]?
}

// MARK: - Maps
struct Maps: Codable {
    let googleMaps, openStreetMaps: String
}

// MARK: - Name
struct Name: Codable {
    let common, official: String
//    let nativeName: [String: Translation]?
}

// MARK: - Translation
struct Translation: Codable {
    let official, common: String
}

// MARK: - PostalCode
struct PostalCode: Codable {
    let format: String
    let regex: String?
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

enum StartOfWeek: String, Codable {
    case monday = "monday"
    case saturday = "saturday"
    case sunday = "sunday"
}

enum Status: String, Codable {
    case officiallyAssigned = "officially-assigned"
    case userAssigned = "user-assigned"
}

typealias CountryList = [CountryListElement]*/

///----------------------------------------------
///
///


import Foundation

struct GamePlan: Decodable {
    var questions: [Question]
    
    struct Question: Decodable{
        var ID: UUID
        var Name: String
        var Region: String
        var Flag: String
    }
}
