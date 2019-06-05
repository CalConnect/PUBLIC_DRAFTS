%%%
title = "JSContact: A JSON representation of addressbook data"
abbrev = "JSContact"
category = "std"
ipr= "trust200902"
area = "Applications"
workgroup = "TBD"
submissiontype = "IETF"
keyword = ["JSON", "addressbook", "contacts", "VCARD"]

date = 2019-02-28T11:55:00Z

[seriesInfo]
name = "Internet-Draft"
value = "draft-stepanek-jscontact-00"
stream = "IETF"
status = "standard"

[[author]]
initials="R."
surname="Stepanek"
fullname="Robert Stepanek"
organization = "FastMail"
  [author.address]
  email = "rsto@fastmailteam.com"
  [author.address.postal]
  city = "Melbourne"
  street = "PO Box 234, Collins St West"
  code = "VIC 8007"
  country = "Australia"
%%%

.# Abstract

This specification defines a data model and JSON representation of contact information that can be used for data storage and exchange in address book or directory applications. It aims to be an alternative to the vCard data format and to be unambiguous, extendable and simple to process. In contrast to the JSON-based jCard format, it is not a direct mapping from the vCard data model and expands semantics where appropriate.

{mainmatter}

# Introduction

This document defines a data model for contact data normally used in address book or directory applications and services. It aims to be an alternative to the vCard data format [@!RFC6350] and to provide a JSON-based standard representation of contacts data.

The key design considerations for this data model are as follows:

- Most of the initial set of attributes should be taken from the vCard data format [@!RFC6350], but the specification should add new attributes or value types, or not support existing ones, where appropriate. Conversion between the data formats need not fully preserve semantic meaning.
- The attributes of the contacts data represented must be described as a simple key-value pair, reducing complexity of its representation.
- The data model should avoid all ambiguities and make it difficult to make mistakes during implementation.
- Extensions, such as new properties and components, MUST NOT lead to requiring an update to this document.

The representation of this data model is defined in the I-JSON format [@!RFC7493], which is a strict subset of the JavaScript Object Notation (JSON) Data Interchange Format [@!RFC8259]. Using JSON is mostly a pragmatic choice: its widespread use makes JSContact easier to adopt, and the availability of production-ready JSON implementations eliminates a whole category of parser-related interoperability issues.

## Relation to the xCard and jCard formats

The xCard [@!RFC6351] and jCard [@!RFC7095] specifications define alternative representations for vCard data, in XML and JSON format respectively. Both explicitly aim to not change the underlying data model. Accordingly, they are regarded as equal to vCard in the context of this document.

## Terminology

The key words "**MUST**", "**MUST NOT**", "**REQUIRED**", "**SHALL**", "**SHALL NOT**", "**SHOULD**",
"**SHOULD NOT**", "**RECOMMENDED**", "**NOT RECOMMENDED**", "**MAY**", and "**OPTIONAL**" in this
document are to be interpreted as described in BCP 14 [@!RFC2119] [@!RFC8174] when, and only when,
they appear in all capitals, as shown here.

# Contact

MIME type: `application/jscontact+json;type=jscontact`

A **JSContact** object stores contact information about a person or company. It has the following properties:

- **uid**: `String`
     A globally unique identifier, used to associate the object as the same across different systems, addressbooks and views.  The value of this property MUST be unique across _all_ JSContact objects. [@!RFC4122] describes a range of established algorithms to generate universally unique identifiers (UUID), and the random or pseudo-random version is recommended.
     For compatibility with [@!RFC6350] UIDs, implementations MUST accept both URI and free-form text.
     A valid JSContact object MUST include this property.

- **fullName**: `String` (mandatory)
  The full name(s) of a contact (e.g. the personal name and surname of an individual, the name of an organization).
- **prefix**: `String` (optional)
  The honorific title(s) of the contact (e.g. "Mr", "Ms", "Dr").
- **personalName**: `String` (optional)
  The personal name(s) of a contact (also known as "first name").
- **surname**: `String` (optional)
  The surname(s) of a contact (also known as "last name").
- **additionalName**: `String` (optional)
  The additional name(s) of a contact (also known as "middle name").
- **suffix**: `String` (optional)
  The honorific suffix(es) of the contact (e.g. "B.A.", "Esq.").
- **nickname**: `String` (optional)
  The nickname(s) of the contact.
- **birthday**: `String` (optional)
  The person's birth date in the form `"YYYY-MM-DD"` (any part may be all `0`s for unknown).
- **anniversary**: `String` (optional)
  The person's anniversary date in the form `"YYYY-MM-DD"` (any part may be all `0`s for unknown).
- **company**: `String` (optional)
  The company for which the person works.
- **department**: `String` (optional)
  The department within the company for which the person works.
- **jobTitle**: `String` (optional)
  The job title of the person.
- **emails**: `ContactInformation[]` (optional)
  An array of ContactInformation objects where the values are email addresses. Types are:
  - `"personal"` The address is for emailing the person in a personal context.
  - `"work"` The address is for emailing the person in a professional context.
  - `"other"` The address is for some other purpose. A *label* property MAY be included to display next to the address to help the user identify its purpose.
- **phones**: `ContactInformation[]` (optional)
  An array of ContactInformation objects where the values are phone numbers. Types are:
  - `"home"` The number is for contacting the person at their residence.
  - `"work"` The number is for contacting the person at their workplace.
  - `"mobile"` The number is for contacting the person regardless of location.
  - `"fax"` The number is for sending faxes to the contact.
  - `"pager"` The number is for a pager or beeper associated with the contact.
  - `"other"` The number is for some other purpose. A *label* property MAY be included to display next to the number to help the user identify its purpose.
- **online**: `ContactInformation[]` (optional)
  An array of ContactInformation objects where the values are URIs or usernames associated with the person for online services.
  Types are:
  - `"uri"` The value is a URI, e.g. a website link.
  - `"username"` The value is a username associated with the person (e.g. for social media, or an IM client). A *label* property SHOULD be included to identify what service this is for. For compatibility between clients, this label SHOULD be the canonical service name, including capitalisation. e.g. `"Twitter"`, `"Facebook"`, `"Skype"`, `"GitHub"`, `"XMPP"`.
  - `"other"` The value is something else not covered by the above categories. A *label* property MAY be included to display next to the number to help the user identify its purpose.
- **addresses**: `Address[]` (optional)
  An array of Address objects, containing physical locations associated with the person.
  Types are:
  - `"home"` An address of a residence associated with the person.
  - `"work"` An address of a workplace associated with the person.
  - `"billing"` An address to be used with billing associated with the person.
  - `"postal"` An address to be used for delivering physical items to the person.
  - `"other"` An address not covered by the above categories.
- **notes**: `String` (optional)
  Arbitrary notes about the contact.

A **ContactInformation** object has the following properties:

- **type**: `String`
  Specifies the context of the contact information. This MUST be taken from the set of values allowed depending on whether this is part of the *phones*, *emails* or *online* property (see above).
- **label**: `String` (optional)
  A label describing the value in more detail, especially if `type === "other"` (but MAY be included with any type).
- **value**: `String`
  The actual contact information, e.g. the email address or phone number.
- **isDefault**: `Boolean` (optional, default: `false`)
  Whether this *ContactInformation* is the default for its type. This SHOULD only be one per type.

An **Address** object has the following properties:

- **type**: `String`
  Specifies the context of the address information. This MUST be taken from the set of values allowed (see above).
- **label**: `String` (optional)
  A label describing the value in more detail, especially if `type === "other"` (but MAY be included with any type).
- **street**: `String` (optional)
  The street address. This MAY be multiple lines; newlines MUST be preserved.
- **locality**: `String` (optional)
  The city, town, village, post town, or other locality within which the street address may be found.
- **region**: `String` (optional)
  The province, such as a state, county, or canton within which the locality may be found.
- **postcode**: `String` (optional)
  The postal code, post code, ZIP code or other short code associated with the address by the relevant country's postal system.
- **country**: `String` (optional)
  The country name.
- **isDefault**: `Boolean` (optional, default: `false`)
  Whether this *Address* is the default for its type. This SHOULD only be one per type.

# Contact Group

MIME type: `application/jscontact+json;type=jscontactgroup`

A **JSContactGroup** object represents a named set of contacts. It has the following properties:

- **uid**: String
  A globally unique identifier. The same requirements as for the JSContact **uid** property apply.
  A valid JSContactGroup object MUST include this property.
- **name**: `String` (optional)
  The user-visible name for the group, e.g. "Friends". This may be any UTF-8 string of at least 1 character in length and maximum 255 octets in size. The same name may be used by two different groups.
- **contactIds**: `String[]`
  The ids of the contacts in the group. Implementations MUST preserve the order of list entries.


# IANA Considerations

TBD

# Security Considerations

TBD

{backmatter}

