/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module soup.c.types;

public import gio.c.types;
public import glib.c.types;
public import gobject.c.types;


/**
 * The type of cache; this affects what kinds of responses will be
 * saved.
 */
public enum SoupCacheType
{
	/**
	 * a single-user cache
	 */
	SINGLE_USER = 0,
	/**
	 * a shared cache
	 */
	SHARED = 1,
}
alias SoupCacheType CacheType;

/**
 * Indicates if a message should or shouldn't be cached.
 */
public enum SoupCacheability
{
	/**
	 * The message should be cached
	 */
	CACHEABLE = 1,
	/**
	 * The message shouldn't be cached
	 */
	UNCACHEABLE = 2,
	/**
	 * The messages cache should be invalidated
	 */
	INVALIDATES = 4,
	/**
	 * The messages cache should be updated
	 */
	VALIDATES = 8,
}
alias SoupCacheability Cacheability;

/**
 * The policy for accepting or rejecting cookies returned in
 * responses.
 */
public enum SoupCookieJarAcceptPolicy
{
	/**
	 * accept all cookies unconditionally.
	 */
	ALWAYS = 0,
	/**
	 * reject all cookies unconditionally.
	 */
	NEVER = 1,
	/**
	 * accept all cookies set by the main
	 * document loaded in the application using libsoup. An example of the most
	 * common case, web browsers, would be: If http://www.example.com is the page
	 * loaded, accept all cookies set by example.com, but if a resource from
	 * http://www.third-party.com is loaded from that page reject any cookie that
	 * it could try to set. For libsoup to be able to tell apart first party
	 * cookies from the rest, the application must call
	 * [method@Message.set_first_party] on each outgoing [class@Message], setting
	 * the [struct@GLib.Uri] of the main document. If no first party is set in a
	 * message when this policy is in effect, cookies will be assumed to be third
	 * party by default.
	 */
	NO_THIRD_PARTY = 2,
	/**
	 * accept all cookies set by
	 * the main document loaded in the application using libsoup, and from domains
	 * that have previously set at least one cookie when loaded as the main
	 * document. An example of the most common case, web browsers, would be: if
	 * http://www.example.com is the page loaded, accept all cookies set by
	 * example.com, but if a resource from http://www.third-party.com is loaded
	 * from that page, reject any cookie that it could try to set unless it
	 * already has a cookie in the cookie jar. For libsoup to be able to tell
	 * apart first party cookies from the rest, the application must call
	 * [method@Message.set_first_party] on each outgoing #SoupMessage, setting the
	 * [struct@GLib.Uri] of the main document. If no first party is set in a
	 * message when this policy is in effect, cookies will be assumed to be third
	 * party by default.
	 */
	GRANDFATHERED_THIRD_PARTY = 3,
}
alias SoupCookieJarAcceptPolicy CookieJarAcceptPolicy;

/**
 * Date formats that [func@date_time_to_string] can use.
 *
 * @SOUP_DATE_HTTP and @SOUP_DATE_COOKIE always coerce the time to
 * UTC.
 *
 * This enum may be extended with more values in future releases.
 */
public enum SoupDateFormat
{
	/**
	 * RFC 1123 format, used by the HTTP "Date" header. Eg
	 * "Sun, 06 Nov 1994 08:49:37 GMT".
	 */
	HTTP = 1,
	/**
	 * The format for the "Expires" timestamp in the
	 * Netscape cookie specification. Eg, "Sun, 06-Nov-1994 08:49:37 GMT".
	 */
	COOKIE = 2,
}
alias SoupDateFormat DateFormat;

/**
 * How a message body is encoded for transport
 */
public enum SoupEncoding
{
	/**
	 * unknown / error
	 */
	UNRECOGNIZED = 0,
	/**
	 * no body is present (which is not the same as a
	 * 0-length body, and only occurs in certain places)
	 */
	NONE = 1,
	/**
	 * Content-Length encoding
	 */
	CONTENT_LENGTH = 2,
	/**
	 * Response body ends when the connection is closed
	 */
	EOF = 3,
	/**
	 * chunked encoding (currently only supported
	 * for response)
	 */
	CHUNKED = 4,
	/**
	 * multipart/byteranges (Reserved for future
	 * use: NOT CURRENTLY IMPLEMENTED)
	 */
	BYTERANGES = 5,
}
alias SoupEncoding Encoding;

/**
 * Represents the parsed value of the "Expect" header.
 */
public enum SoupExpectation
{
	/**
	 * any unrecognized expectation
	 */
	UNRECOGNIZED = 1,
	/**
	 * "100-continue"
	 */
	CONTINUE = 2,
}
alias SoupExpectation Expectation;

/**
 * Indicates the HTTP protocol version being used.
 */
public enum SoupHTTPVersion
{
	/**
	 * HTTP 1.0 (RFC 1945)
	 */
	HTTP_1_0 = 0,
	/**
	 * HTTP 1.1 (RFC 2616)
	 */
	HTTP_1_1 = 1,
	/**
	 * HTTP 2.0 (RFC 7540)
	 */
	HTTP_2_0 = 2,
}
alias SoupHTTPVersion HTTPVersion;

/**
 * Describes the level of logging output to provide.
 */
public enum SoupLoggerLogLevel
{
	/**
	 * No logging
	 */
	NONE = 0,
	/**
	 * Log the Request-Line or Status-Line and
	 * the Soup-Debug pseudo-headers
	 */
	MINIMAL = 1,
	/**
	 * Log the full request/response headers
	 */
	HEADERS = 2,
	/**
	 * Log the full headers and request/response bodies
	 */
	BODY = 3,
}
alias SoupLoggerLogLevel LoggerLogLevel;

/**
 * The lifetime of the memory being passed.
 */
public enum SoupMemoryUse
{
	/**
	 * The memory is statically allocated and
	 * constant; libsoup can use the passed-in buffer directly and not
	 * need to worry about it being modified or freed.
	 */
	STATIC = 0,
	/**
	 * The caller has allocated the memory and libsoup
	 * will assume ownership of it and free it with [func@GLib.free].
	 */
	TAKE = 1,
	/**
	 * The passed-in data belongs to the caller and
	 * libsoup will copy it into new memory leaving the caller free
	 * to reuse the original memory.
	 */
	COPY = 2,
}
alias SoupMemoryUse MemoryUse;

/**
 * Various flags that can be set on a #SoupMessage to alter its
 * behavior.
 */
public enum SoupMessageFlags
{
	/**
	 * The session should not follow redirect
	 * (3xx) responses received by this message.
	 */
	NO_REDIRECT = 2,
	/**
	 * Requests that the message should be
	 * sent on a newly-created connection, not reusing an existing
	 * persistent connection. Note that messages with non-idempotent
	 * [property@Message:method]s behave this way by default, unless
	 * #SOUP_MESSAGE_IDEMPOTENT is set.
	 */
	NEW_CONNECTION = 4,
	/**
	 * The message is considered idempotent,
	 * regardless its [property@Message:method], and allows reuse of existing
	 * idle connections, instead of always requiring a new one, unless
	 * #SOUP_MESSAGE_NEW_CONNECTION is set.
	 */
	IDEMPOTENT = 8,
	/**
	 * The [class@AuthManager] should not use
	 * the credentials cache for this message, neither to use cached credentials
	 * to automatically authenticate this message nor to cache the credentials
	 * after the message is successfully authenticated. This applies to both server
	 * and proxy authentication. Note that [signal@Message::authenticate] signal will
	 * be emitted, if you want to disable authentication for a message use
	 * [method@Message.disable_feature] passing #SOUP_TYPE_AUTH_MANAGER instead.
	 */
	DO_NOT_USE_AUTH_CACHE = 16,
	/**
	 * Metrics will be collected for this message.
	 */
	COLLECT_METRICS = 32,
}
alias SoupMessageFlags MessageFlags;

/**
 * Value passed to [ctor@MessageHeaders.new] to set certain default
 * behaviors.
 */
public enum SoupMessageHeadersType
{
	/**
	 * request headers
	 */
	REQUEST = 0,
	/**
	 * response headers
	 */
	RESPONSE = 1,
	/**
	 * multipart body part headers
	 */
	MULTIPART = 2,
}
alias SoupMessageHeadersType MessageHeadersType;

/**
 * Priorities that can be set on a [class@Message] to instruct the message queue
 * to process it before any other message with lower priority.
 */
public enum SoupMessagePriority
{
	/**
	 * The lowest priority, the messages
	 * with this priority will be the last ones to be attended.
	 */
	VERY_LOW = 0,
	/**
	 * Use this for low priority messages, a
	 * #SoupMessage with the default priority will be processed first.
	 */
	LOW = 1,
	/**
	 * The default priotity, this is the
	 * priority assigned to the #SoupMessage by default.
	 */
	NORMAL = 2,
	/**
	 * High priority, a #SoupMessage with
	 * this priority will be processed before the ones with the default
	 * priority.
	 */
	HIGH = 3,
	/**
	 * The highest priority, use this
	 * for very urgent #SoupMessage as they will be the first ones to be
	 * attended.
	 */
	VERY_HIGH = 4,
}
alias SoupMessagePriority MessagePriority;

/**
 * Represents the same-site policies of a cookie.
 */
public enum SoupSameSitePolicy
{
	/**
	 * The cookie is exposed with both cross-site and same-site requests
	 */
	NONE = 0,
	/**
	 * The cookie is withheld on cross-site requests but exposed on cross-site navigations
	 */
	LAX = 1,
	/**
	 * The cookie is only exposed for same-site requests
	 */
	STRICT = 2,
}
alias SoupSameSitePolicy SameSitePolicy;

/**
 * Options to pass to [method@Server.listen], etc.
 *
 * %SOUP_SERVER_LISTEN_IPV4_ONLY and %SOUP_SERVER_LISTEN_IPV6_ONLY
 * only make sense with [method@Server.listen_all] and
 * [method@Server.listen_local], not plain [method@Server.listen] (which
 * simply listens on whatever kind of socket you give it). And you
 * cannot specify both of them in a single call.
 */
public enum SoupServerListenOptions
{
	/**
	 * Listen for https connections rather
	 * than plain http.
	 */
	HTTPS = 1,
	/**
	 * Only listen on IPv4 interfaces.
	 */
	IPV4_ONLY = 2,
	/**
	 * Only listen on IPv6 interfaces.
	 */
	IPV6_ONLY = 4,
}
alias SoupServerListenOptions ServerListenOptions;

/**
 * A #SoupSession error.
 */
public enum SoupSessionError
{
	/**
	 * the server's response could not
	 * be parsed
	 */
	PARSING = 0,
	/**
	 * the server's response was in an
	 * unsupported format
	 */
	ENCODING = 1,
	/**
	 * the message has been redirected
	 * too many times
	 */
	TOO_MANY_REDIRECTS = 2,
	/**
	 * the message has been restarted
	 * too many times
	 */
	TOO_MANY_RESTARTS = 3,
	/**
	 * failed to redirect message because
	 * Location header was missing or empty in response
	 */
	REDIRECT_NO_LOCATION = 4,
	/**
	 * failed to redirect message because
	 * Location header contains an invalid URI
	 */
	REDIRECT_BAD_URI = 5,
	/**
	 * the message is already in the
	 * session queue. Messages can only be reused after unqueued.
	 */
	MESSAGE_ALREADY_IN_QUEUE = 6,
}
alias SoupSessionError SessionError;

/**
 * These represent the known HTTP status code values, plus various
 * network and internal errors.
 *
 * Note that no libsoup functions take or return this type directly;
 * any function that works with status codes will accept unrecognized
 * status codes as well.
 */
public enum SoupStatus
{
	/**
	 * No status available. (Eg, the message has not
	 * been sent yet)
	 */
	NONE = 0,
	/**
	 * 100 Continue (HTTP)
	 */
	CONTINUE = 100,
	/**
	 * 101 Switching Protocols (HTTP)
	 */
	SWITCHING_PROTOCOLS = 101,
	/**
	 * 102 Processing (WebDAV)
	 */
	PROCESSING = 102,
	/**
	 * 200 Success (HTTP). Also used by many lower-level
	 * soup routines to indicate success.
	 */
	OK = 200,
	/**
	 * 201 Created (HTTP)
	 */
	CREATED = 201,
	/**
	 * 202 Accepted (HTTP)
	 */
	ACCEPTED = 202,
	/**
	 * 203 Non-Authoritative Information
	 * (HTTP)
	 */
	NON_AUTHORITATIVE = 203,
	/**
	 * 204 No Content (HTTP)
	 */
	NO_CONTENT = 204,
	/**
	 * 205 Reset Content (HTTP)
	 */
	RESET_CONTENT = 205,
	/**
	 * 206 Partial Content (HTTP)
	 */
	PARTIAL_CONTENT = 206,
	/**
	 * 207 Multi-Status (WebDAV)
	 */
	MULTI_STATUS = 207,
	/**
	 * 300 Multiple Choices (HTTP)
	 */
	MULTIPLE_CHOICES = 300,
	/**
	 * 301 Moved Permanently (HTTP)
	 */
	MOVED_PERMANENTLY = 301,
	/**
	 * 302 Found (HTTP)
	 */
	FOUND = 302,
	/**
	 * 302 Moved Temporarily (old name,
	 * RFC 2068)
	 */
	MOVED_TEMPORARILY = 302,
	/**
	 * 303 See Other (HTTP)
	 */
	SEE_OTHER = 303,
	/**
	 * 304 Not Modified (HTTP)
	 */
	NOT_MODIFIED = 304,
	/**
	 * 305 Use Proxy (HTTP)
	 */
	USE_PROXY = 305,
	/**
	 * 306 [Unused] (HTTP)
	 */
	NOT_APPEARING_IN_THIS_PROTOCOL = 306,
	/**
	 * 307 Temporary Redirect (HTTP)
	 */
	TEMPORARY_REDIRECT = 307,
	/**
	 * 308 Permanent Redirect (HTTP)
	 */
	PERMANENT_REDIRECT = 308,
	/**
	 * 400 Bad Request (HTTP)
	 */
	BAD_REQUEST = 400,
	/**
	 * 401 Unauthorized (HTTP)
	 */
	UNAUTHORIZED = 401,
	/**
	 * 402 Payment Required (HTTP)
	 */
	PAYMENT_REQUIRED = 402,
	/**
	 * 403 Forbidden (HTTP)
	 */
	FORBIDDEN = 403,
	/**
	 * 404 Not Found (HTTP)
	 */
	NOT_FOUND = 404,
	/**
	 * 405 Method Not Allowed (HTTP)
	 */
	METHOD_NOT_ALLOWED = 405,
	/**
	 * 406 Not Acceptable (HTTP)
	 */
	NOT_ACCEPTABLE = 406,
	/**
	 * 407 Proxy Authentication
	 * Required (HTTP)
	 */
	PROXY_AUTHENTICATION_REQUIRED = 407,
	/**
	 * shorter alias for
	 * %SOUP_STATUS_PROXY_AUTHENTICATION_REQUIRED
	 */
	PROXY_UNAUTHORIZED = 407,
	/**
	 * 408 Request Timeout (HTTP)
	 */
	REQUEST_TIMEOUT = 408,
	/**
	 * 409 Conflict (HTTP)
	 */
	CONFLICT = 409,
	/**
	 * 410 Gone (HTTP)
	 */
	GONE = 410,
	/**
	 * 411 Length Required (HTTP)
	 */
	LENGTH_REQUIRED = 411,
	/**
	 * 412 Precondition Failed (HTTP)
	 */
	PRECONDITION_FAILED = 412,
	/**
	 * 413 Request Entity Too Large
	 * (HTTP)
	 */
	REQUEST_ENTITY_TOO_LARGE = 413,
	/**
	 * 414 Request-URI Too Long (HTTP)
	 */
	REQUEST_URI_TOO_LONG = 414,
	/**
	 * 415 Unsupported Media Type
	 * (HTTP)
	 */
	UNSUPPORTED_MEDIA_TYPE = 415,
	/**
	 * 416 Requested Range
	 * Not Satisfiable (HTTP)
	 */
	REQUESTED_RANGE_NOT_SATISFIABLE = 416,
	/**
	 * shorter alias for
	 * %SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE
	 */
	INVALID_RANGE = 416,
	/**
	 * 417 Expectation Failed (HTTP)
	 */
	EXPECTATION_FAILED = 417,
	/**
	 * 421 Misdirected Request
	 */
	MISDIRECTED_REQUEST = 421,
	/**
	 * 422 Unprocessable Entity
	 * (WebDAV)
	 */
	UNPROCESSABLE_ENTITY = 422,
	/**
	 * 423 Locked (WebDAV)
	 */
	LOCKED = 423,
	/**
	 * 424 Failed Dependency (WebDAV)
	 */
	FAILED_DEPENDENCY = 424,
	/**
	 * 500 Internal Server Error
	 * (HTTP)
	 */
	INTERNAL_SERVER_ERROR = 500,
	/**
	 * 501 Not Implemented (HTTP)
	 */
	NOT_IMPLEMENTED = 501,
	/**
	 * 502 Bad Gateway (HTTP)
	 */
	BAD_GATEWAY = 502,
	/**
	 * 503 Service Unavailable (HTTP)
	 */
	SERVICE_UNAVAILABLE = 503,
	/**
	 * 504 Gateway Timeout (HTTP)
	 */
	GATEWAY_TIMEOUT = 504,
	/**
	 * 505 HTTP Version Not
	 * Supported (HTTP)
	 */
	HTTP_VERSION_NOT_SUPPORTED = 505,
	/**
	 * 507 Insufficient Storage
	 * (WebDAV)
	 */
	INSUFFICIENT_STORAGE = 507,
	/**
	 * 510 Not Extended (RFC 2774)
	 */
	NOT_EXTENDED = 510,
}
alias SoupStatus Status;

/**
 * Error codes for %SOUP_TLD_ERROR.
 */
public enum SoupTLDError
{
	/**
	 * A hostname was syntactically
	 * invalid.
	 */
	INVALID_HOSTNAME = 0,
	/**
	 * The passed-in "hostname" was
	 * actually an IP address (and thus has no base domain or
	 * public suffix).
	 */
	IS_IP_ADDRESS = 1,
	/**
	 * The passed-in hostname
	 * did not have enough components. Eg, calling
	 * [func@tld_get_base_domain] on <literal>"co.uk"</literal>.
	 */
	NOT_ENOUGH_DOMAINS = 2,
	/**
	 * The passed-in hostname has
	 * no recognized public suffix.
	 */
	NO_BASE_DOMAIN = 3,
	/**
	 * The Public Suffix List was not
	 * available.
	 */
	NO_PSL_DATA = 4,
}
alias SoupTLDError TLDError;

/**
 * Enum values passed to [func@uri_copy] to indicate the components of
 * the URI that should be updated with the given values.
 */
public enum SoupURIComponent
{
	/**
	 * no component
	 */
	NONE = 0,
	/**
	 * the URI scheme component
	 */
	SCHEME = 1,
	/**
	 * the URI user component
	 */
	USER = 2,
	/**
	 * the URI password component
	 */
	PASSWORD = 3,
	/**
	 * the URI authentication parameters component
	 */
	AUTH_PARAMS = 4,
	/**
	 * the URI host component
	 */
	HOST = 5,
	/**
	 * the URI port component
	 */
	PORT = 6,
	/**
	 * the URI path component
	 */
	PATH = 7,
	/**
	 * the URI query component
	 */
	QUERY = 8,
	/**
	 * the URI fragment component
	 */
	FRAGMENT = 9,
}
alias SoupURIComponent URIComponent;

/**
 * Pre-defined close codes that can be passed to
 * [method@WebsocketConnection.close] or received from
 * [method@WebsocketConnection.get_close_code].
 *
 * However, other codes are also allowed.
 */
public enum SoupWebsocketCloseCode
{
	/**
	 * a normal, non-error close
	 */
	NORMAL = 1000,
	/**
	 * the client/server is going away
	 */
	GOING_AWAY = 1001,
	/**
	 * a protocol error occurred
	 */
	PROTOCOL_ERROR = 1002,
	/**
	 * the endpoint received data
	 * of a type that it does not support.
	 */
	UNSUPPORTED_DATA = 1003,
	/**
	 * reserved value indicating that
	 * no close code was present; must not be sent.
	 */
	NO_STATUS = 1005,
	/**
	 * reserved value indicating that
	 * the connection was closed abnormally; must not be sent.
	 */
	ABNORMAL = 1006,
	/**
	 * the endpoint received data that
	 * was invalid (eg, non-UTF-8 data in a text message).
	 */
	BAD_DATA = 1007,
	/**
	 * generic error code
	 * indicating some sort of policy violation.
	 */
	POLICY_VIOLATION = 1008,
	/**
	 * the endpoint received a message
	 * that is too big to process.
	 */
	TOO_BIG = 1009,
	/**
	 * the client is closing the
	 * connection because the server failed to negotiate a required
	 * extension.
	 */
	NO_EXTENSION = 1010,
	/**
	 * the server is closing the
	 * connection because it was unable to fulfill the request.
	 */
	SERVER_ERROR = 1011,
	/**
	 * reserved value indicating that
	 * the TLS handshake failed; must not be sent.
	 */
	TLS_HANDSHAKE = 1015,
}
alias SoupWebsocketCloseCode WebsocketCloseCode;

/**
 * The type of a [class@WebsocketConnection].
 */
public enum SoupWebsocketConnectionType
{
	/**
	 * unknown/invalid connection
	 */
	UNKNOWN = 0,
	/**
	 * a client-side connection
	 */
	CLIENT = 1,
	/**
	 * a server-side connection
	 */
	SERVER = 2,
}
alias SoupWebsocketConnectionType WebsocketConnectionType;

/**
 * The type of data contained in a [signal@WebsocketConnection::message] signal.
 */
public enum SoupWebsocketDataType
{
	/**
	 * UTF-8 text
	 */
	TEXT = 1,
	/**
	 * binary data
	 */
	BINARY = 2,
}
alias SoupWebsocketDataType WebsocketDataType;

/**
 * WebSocket-related errors.
 */
public enum SoupWebsocketError
{
	/**
	 * a generic error
	 */
	FAILED = 0,
	/**
	 * attempted to handshake with a
	 * server that does not appear to understand WebSockets.
	 */
	NOT_WEBSOCKET = 1,
	/**
	 * the WebSocket handshake failed
	 * because some detail was invalid (eg, incorrect accept key).
	 */
	BAD_HANDSHAKE = 2,
	/**
	 * the WebSocket handshake failed
	 * because the "Origin" header was not an allowed value.
	 */
	BAD_ORIGIN = 3,
}
alias SoupWebsocketError WebsocketError;

/**
 * The state of the WebSocket connection.
 */
public enum SoupWebsocketState
{
	/**
	 * the connection is ready to send messages
	 */
	OPEN = 1,
	/**
	 * the connection is in the process of
	 * closing down; messages may be received, but not sent
	 */
	CLOSING = 2,
	/**
	 * the connection is completely closed down
	 */
	CLOSED = 3,
}
alias SoupWebsocketState WebsocketState;

struct SoupAuth
{
	GObject parentInstance;
}

struct SoupAuthBasic;

struct SoupAuthClass
{
	GObjectClass parentClass;
	const(char)* schemeName;
	uint strength;
	/**
	 *
	 * Params:
	 *     auth = a #SoupAuth
	 *     msg = the #SoupMessage @auth is being updated for
	 *     authHeader = the WWW-Authenticate/Proxy-Authenticate header
	 * Returns: %TRUE if @auth is still a valid (but potentially
	 *     unauthenticated) #SoupAuth. %FALSE if something about @auth_params
	 *     could not be parsed or incorporated into @auth at all.
	 */
	extern(C) int function(SoupAuth* auth, SoupMessage* msg, GHashTable* authHeader) update;
	/**
	 *
	 * Params:
	 *     auth = a #SoupAuth
	 *     sourceUri = the URI of the request that @auth was generated in
	 *         response to.
	 * Returns: the list of
	 *     paths, which can be freed with [method@Auth.free_protection_space].
	 */
	extern(C) GSList* function(SoupAuth* auth, GUri* sourceUri) getProtectionSpace;
	/** */
	extern(C) void function(SoupAuth* auth, const(char)* username, const(char)* password) authenticate;
	/**
	 *
	 * Params:
	 *     auth = a #SoupAuth
	 * Returns: %TRUE if @auth has been given a username and password
	 */
	extern(C) int function(SoupAuth* auth) isAuthenticated;
	/**
	 *
	 * Params:
	 *     auth = a #SoupAuth
	 *     msg = the #SoupMessage to be authorized
	 * Returns: the "Authorization" header, which must be freed.
	 */
	extern(C) char* function(SoupAuth* auth, SoupMessage* msg) getAuthorization;
	/**
	 *
	 * Params:
	 *     auth = a #SoupAuth
	 *     msg = a #SoupMessage
	 * Returns: %TRUE if @auth is ready to make a request with.
	 */
	extern(C) int function(SoupAuth* auth, SoupMessage* msg) isReady;
	/**
	 *
	 * Params:
	 *     auth = a #SoupAuth
	 * Returns: %TRUE if @auth is able to accept credentials.
	 */
	extern(C) int function(SoupAuth* auth) canAuthenticate;
	void*[6] padding;
}

struct SoupAuthDigest;

struct SoupAuthDomain
{
	GObject parentInstance;
}

struct SoupAuthDomainBasic;

struct SoupAuthDomainBasicClass
{
	SoupAuthDomainClass parentClass;
}

struct SoupAuthDomainClass
{
	GObjectClass parentClass;
	/** */
	extern(C) char* function(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* header) accepts;
	/** */
	extern(C) char* function(SoupAuthDomain* domain, SoupServerMessage* msg) challenge;
	/**
	 *
	 * Params:
	 *     domain = a #SoupAuthDomain
	 *     msg = a #SoupServerMessage
	 *     username = a username
	 *     password = a password
	 * Returns: whether or not the message is authenticated
	 */
	extern(C) int function(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, const(char)* password) checkPassword;
	void*[6] padding;
}

struct SoupAuthDomainDigest;

struct SoupAuthDomainDigestClass
{
	SoupAuthDomainClass parentClass;
}

struct SoupAuthManager;

struct SoupAuthManagerClass
{
	GObjectClass parentClass;
}

struct SoupAuthNTLM;

struct SoupAuthNegotiate;

struct SoupCache
{
	GObject parentInstance;
}

struct SoupCacheClass
{
	GObjectClass parentClass;
	/** */
	extern(C) SoupCacheability function(SoupCache* cache, SoupMessage* msg) getCacheability;
	void*[4] padding;
}

struct SoupContentDecoder;

struct SoupContentDecoderClass
{
	GObjectClass parentClass;
}

struct SoupContentSniffer;

struct SoupContentSnifferClass
{
	GObjectClass parentClass;
}

struct SoupCookie;

struct SoupCookieJar
{
	GObject parentInstance;
}

struct SoupCookieJarClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function(SoupCookieJar* jar) save;
	/**
	 *
	 * Params:
	 *     jar = a #SoupCookieJar
	 * Returns: %TRUE if @jar storage is persistent or %FALSE otherwise.
	 */
	extern(C) int function(SoupCookieJar* jar) isPersistent;
	/** */
	extern(C) void function(SoupCookieJar* jar, SoupCookie* oldCookie, SoupCookie* newCookie) changed;
	void*[6] padding;
}

struct SoupCookieJarDB;

struct SoupCookieJarDBClass
{
	SoupCookieJarClass parentClass;
}

struct SoupCookieJarText;

struct SoupCookieJarTextClass
{
	SoupCookieJarClass parentClass;
}

struct SoupHSTSEnforcer
{
	GObject parentInstance;
}

/**
 * Class structure for #SoupHSTSEnforcer.
 */
struct SoupHSTSEnforcerClass
{
	/**
	 * The parent class.
	 */
	GObjectClass parentClass;
	/**
	 *
	 * Params:
	 *     hstsEnforcer = a #SoupHSTSEnforcer
	 * Returns: %TRUE if @hsts_enforcer storage is persistent or %FALSE otherwise.
	 */
	extern(C) int function(SoupHSTSEnforcer* hstsEnforcer) isPersistent;
	/**
	 *
	 * Params:
	 *     hstsEnforcer = a #SoupHSTSEnforcer
	 *     domain = a domain.
	 * Returns: %TRUE if access to @domain should happen over HTTPS, false
	 *     otherwise.
	 */
	extern(C) int function(SoupHSTSEnforcer* hstsEnforcer, const(char)* domain) hasValidPolicy;
	/** */
	extern(C) void function(SoupHSTSEnforcer* enforcer, SoupHSTSPolicy* oldPolicy, SoupHSTSPolicy* newPolicy) changed;
	void*[4] padding;
}

struct SoupHSTSEnforcerDB;

struct SoupHSTSEnforcerDBClass
{
	SoupHSTSEnforcerClass parentClass;
}

struct SoupHSTSPolicy;

struct SoupLogger;

struct SoupLoggerClass
{
	GObjectClass parentClass;
}

struct SoupMessage;

struct SoupMessageBody
{
	/**
	 * the data
	 */
	char* data;
	/**
	 * length of @data
	 */
	long length;
}

struct SoupMessageClass
{
	GObjectClass parentClass;
}

struct SoupMessageHeaders;

struct SoupMessageHeadersIter
{
	void*[3] dummy;
}

struct SoupMessageMetrics;

struct SoupMultipart;

struct SoupMultipartInputStream;

struct SoupMultipartInputStreamClass
{
	GFilterInputStreamClass parentClass;
}

/**
 * Represents a byte range as used in the Range header.
 *
 * If @end is non-negative, then @start and @end represent the bounds
 * of of the range, counting from 0. (Eg, the first 500 bytes would be
 * represented as @start = 0 and @end = 499.)
 *
 * If @end is -1 and @start is non-negative, then this represents a
 * range starting at @start and ending with the last byte of the
 * requested resource body. (Eg, all but the first 500 bytes would be
 * @start = 500, and @end = -1.)
 *
 * If @end is -1 and @start is negative, then it represents a "suffix
 * range", referring to the last -@start bytes of the resource body.
 * (Eg, the last 500 bytes would be @start = -500 and @end = -1.)
 */
struct SoupRange
{
	/**
	 * the start of the range
	 */
	long start;
	/**
	 * the end of the range
	 */
	long end;
}

struct SoupServer
{
	GObject parentInstance;
}

struct SoupServerClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function(SoupServer* server, SoupServerMessage* msg) requestStarted;
	/** */
	extern(C) void function(SoupServer* server, SoupServerMessage* msg) requestRead;
	/** */
	extern(C) void function(SoupServer* server, SoupServerMessage* msg) requestFinished;
	/** */
	extern(C) void function(SoupServer* server, SoupServerMessage* msg) requestAborted;
	void*[6] padding;
}

struct SoupServerMessage;

struct SoupServerMessageClass
{
	GObjectClass parentClass;
}

struct SoupSession
{
	GObject parentInstance;
}

struct SoupSessionClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function(SoupSession* session, SoupMessage* msg) requestQueued;
	/** */
	extern(C) void function(SoupSession* session, SoupMessage* msg) requestUnqueued;
	/** */
	extern(C) void function() SoupReserved1;
	/** */
	extern(C) void function() SoupReserved2;
	/** */
	extern(C) void function() SoupReserved3;
	/** */
	extern(C) void function() SoupReserved4;
	/** */
	extern(C) void function() SoupReserved5;
	/** */
	extern(C) void function() SoupReserved6;
	/** */
	extern(C) void function() SoupReserved7;
	/** */
	extern(C) void function() SoupReserved8;
}

struct SoupSessionFeature;

/**
 * The interface implemented by [iface@SessionFeature]s.
 */
struct SoupSessionFeatureInterface;

struct SoupWebsocketConnection;

/**
 * The abstract base class for [class@WebsocketConnection].
 */
struct SoupWebsocketConnectionClass
{
	GObjectClass parentClass;
}

struct SoupWebsocketExtension
{
	GObject parentInstance;
}

/**
 * The class structure for the #SoupWebsocketExtension.
 */
struct SoupWebsocketExtensionClass
{
	/**
	 * the parent class
	 */
	GObjectClass parentClass;
	/**
	 * the name of the extension
	 */
	const(char)* name;
	/**
	 *
	 * Params:
	 *     extension = a #SoupWebsocketExtension
	 *     connectionType = either %SOUP_WEBSOCKET_CONNECTION_CLIENT or %SOUP_WEBSOCKET_CONNECTION_SERVER
	 *     params = the parameters
	 * Returns: %TRUE if extension could be configured with the given parameters, or %FALSE otherwise
	 *
	 * Throws: GException on failure.
	 */
	extern(C) int function(SoupWebsocketExtension* extension, SoupWebsocketConnectionType connectionType, GHashTable* params, GError** err) configure;
	/**
	 *
	 * Params:
	 *     extension = a #SoupWebsocketExtension
	 * Returns: a new allocated string with the parameters
	 */
	extern(C) char* function(SoupWebsocketExtension* extension) getRequestParams;
	/**
	 *
	 * Params:
	 *     extension = a #SoupWebsocketExtension
	 * Returns: a new allocated string with the parameters
	 */
	extern(C) char* function(SoupWebsocketExtension* extension) getResponseParams;
	/**
	 *
	 * Params:
	 *     extension = a #SoupWebsocketExtension
	 *     header = the message header
	 *     payload = the payload data
	 * Returns: the message payload data, or %NULL in case of error
	 *
	 * Throws: GException on failure.
	 */
	extern(C) GBytes* function(SoupWebsocketExtension* extension, ubyte* header, GBytes* payload, GError** err) processOutgoingMessage;
	/**
	 *
	 * Params:
	 *     extension = a #SoupWebsocketExtension
	 *     header = the message header
	 *     payload = the payload data
	 * Returns: the message payload data, or %NULL in case of error
	 *
	 * Throws: GException on failure.
	 */
	extern(C) GBytes* function(SoupWebsocketExtension* extension, ubyte* header, GBytes* payload, GError** err) processIncomingMessage;
	void*[6] padding;
}

struct SoupWebsocketExtensionDeflate;

struct SoupWebsocketExtensionDeflateClass
{
	SoupWebsocketExtensionClass parentClass;
}

struct SoupWebsocketExtensionManager;

struct SoupWebsocketExtensionManagerClass
{
	GObjectClass parentClass;
}

/**
 * Callback used by #SoupAuthDomainBasic for authentication purposes.
 *
 * The application should verify that @username and @password and valid
 * and return %TRUE or %FALSE.
 *
 * If you are maintaining your own password database (rather than
 * using the password to authenticate against some other system like
 * PAM or a remote server), you should make sure you know what you are
 * doing. In particular, don't store cleartext passwords, or
 * easily-computed hashes of cleartext passwords, even if you don't
 * care that much about the security of your server, because users
 * will frequently use the same password for multiple sites, and so
 * compromising any site with a cleartext (or easily-cracked) password
 * database may give attackers access to other more-interesting sites
 * as well.
 *
 * Params:
 *     domain = the domain
 *     msg = the message being authenticated
 *     username = the username provided by the client
 *     password = the password provided by the client
 *     userData = the data passed to [method@AuthDomainBasic.set_auth_callback]
 *
 * Returns: %TRUE if @username and @password are valid
 */
public alias extern(C) int function(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, const(char)* password, void* userData) SoupAuthDomainBasicAuthCallback;

/**
 * Callback used by #SoupAuthDomainDigest for authentication purposes.
 *
 * The application should look up @username in its password database,
 * and return the corresponding encoded password (see
 * [func@AuthDomainDigest.encode_password].
 *
 * Params:
 *     domain = the domain
 *     msg = the message being authenticated
 *     username = the username provided by the client
 *     userData = the data passed to [method@AuthDomainDigest.set_auth_callback]
 *
 * Returns: the encoded password, or %NULL if
 *     @username is not a valid user. @domain will free the password when
 *     it is done with it.
 */
public alias extern(C) char* function(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, void* userData) SoupAuthDomainDigestAuthCallback;

/**
 * The prototype for a #SoupAuthDomain filter.
 *
 * See [method@AuthDomain.set_filter] for details.
 *
 * Params:
 *     domain = a #SoupAuthDomain
 *     msg = a #SoupServerMessage
 *     userData = the data passed to [method@AuthDomain.set_filter]
 *
 * Returns: %TRUE if @msg requires authentication, %FALSE if not.
 */
public alias extern(C) int function(SoupAuthDomain* domain, SoupServerMessage* msg, void* userData) SoupAuthDomainFilter;

/**
 * The prototype for a #SoupAuthDomain generic authentication callback.
 *
 * The callback should look up the user's password, call
 * [method@AuthDomain.check_password], and use the return value from that method
 * as its own return value.
 *
 * In general, for security reasons, it is preferable to use the
 * auth-domain-specific auth callbacks (eg,
 * [callback@AuthDomainBasicAuthCallback] and
 * [callback@AuthDomainDigestAuthCallback]), because they don't require
 * keeping a cleartext password database. Most users will use the same
 * password for many different sites, meaning if any site with a
 * cleartext password database is compromised, accounts on other
 * servers might be compromised as well. For many of the cases where
 * [class@Server] is used, this is not really relevant, but it may still
 * be worth considering.
 *
 * Params:
 *     domain = a #SoupAuthDomain
 *     msg = the #SoupServerMessage being authenticated
 *     username = the username from @msg
 *     userData = the data passed to [method@AuthDomain.set_generic_auth_callback]
 *
 * Returns: %TRUE if @msg is authenticated, %FALSE if not.
 */
public alias extern(C) int function(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, void* userData) SoupAuthDomainGenericAuthCallback;

/**
 * The prototype for a logging filter.
 *
 * The filter callback will be invoked for each request or response, and should
 * analyze it and return a [enum@LoggerLogLevel] value indicating how much of
 * the message to log.
 *
 * Params:
 *     logger = the #SoupLogger
 *     msg = the message being logged
 *     userData = the data passed to [method@Logger.set_request_filter]
 *         or [method@Logger.set_response_filter]
 *
 * Returns: a [enum@LoggerLogLevel] value indicating how much of the message to
 *     log
 */
public alias extern(C) SoupLoggerLogLevel function(SoupLogger* logger, SoupMessage* msg, void* userData) SoupLoggerFilter;

/**
 * The prototype for a custom printing callback.
 *
 * @level indicates what kind of information is being printed. Eg, it
 * will be %SOUP_LOGGER_LOG_HEADERS if @data is header data.
 *
 * @direction is either '<', '>', or ' ', and @data is the single line
 * to print; the printer is expected to add a terminating newline.
 *
 * To get the effect of the default printer, you would do:
 *
 * ```c
 * printf ("%c %s\n", direction, data);
 * ```
 *
 * Params:
 *     logger = the #SoupLogger
 *     level = the level of the information being printed.
 *     direction = a single-character prefix to @data
 *     data = data to print
 *     userData = the data passed to [method@Logger.set_printer]
 */
public alias extern(C) void function(SoupLogger* logger, SoupLoggerLogLevel level, char direction, const(char)* data, void* userData) SoupLoggerPrinter;

/**
 * The callback passed to [method@MessageHeaders.foreach].
 *
 * Params:
 *     name = the header name
 *     value = the header value
 *     userData = the data passed to [method@MessageHeaders.foreach]
 */
public alias extern(C) void function(const(char)* name, const(char)* value, void* userData) SoupMessageHeadersForeachFunc;

/**
 * A callback used to handle requests to a [class@Server].
 *
 * @path and @query contain the likewise-named components of the
 * Request-URI, subject to certain assumptions. By default,
 * [class@Server] decodes all percent-encoding in the URI path, such that
 * `"/foo%2Fbar"` is treated the same as `"/foo/bar"`. If your
 * server is serving resources in some non-POSIX-filesystem namespace,
 * you may want to distinguish those as two distinct paths. In that
 * case, you can set the [property@Server:raw-paths] property when creating
 * the [class@Server], and it will leave those characters undecoded.
 *
 * @query contains the query component of the Request-URI parsed according to
 * the rules for HTML form handling. Although this is the only commonly-used
 * query string format in HTTP, there is nothing that actually requires that
 * HTTP URIs use that format; if your server needs to use some other format, you
 * can just ignore @query, and call [method@Message.get_uri] and parse the URI's
 * query field yourself.
 *
 * See [method@Server.add_handler] and [method@Server.add_early_handler]
 * for details of what handlers can/should do.
 *
 * Params:
 *     server = the #SoupServer
 *     msg = the message being processed
 *     path = the path component of @msg's Request-URI
 *     query = the parsed query
 *         component of @msg's Request-URI
 *     userData = the data passed to [method@Server.add_handler] or
 *         [method@Server.add_early_handler].
 */
public alias extern(C) void function(SoupServer* server, SoupServerMessage* msg, const(char)* path, GHashTable* query, void* userData) SoupServerCallback;

/**
 * A callback used to handle WebSocket requests to a #SoupServer.
 *
 * The callback will be invoked after sending the handshake response back to the
 * client (and is only invoked if the handshake was successful).
 *
 * @path contains the path of the Request-URI, subject to the same
 * rules as [callback@ServerCallback] `(qv)`.
 *
 * Params:
 *     server = the #SoupServer
 *     msg = the #SoupServerMessage
 *     path = the path component of @msg's Request-URI
 *     connection = the newly created WebSocket connection
 *     userData = the data passed to @soup_server_add_handler
 */
public alias extern(C) void function(SoupServer* server, SoupServerMessage* msg, const(char)* path, SoupWebsocketConnection* connection, void* userData) SoupServerWebsocketCallback;

/**
 * A constant corresponding to 1 day.
 *
 * For use with [ctor@Cookie.new] and [method@Cookie.set_max_age].
 */
enum COOKIE_MAX_AGE_ONE_DAY = 0;
alias SOUP_COOKIE_MAX_AGE_ONE_DAY = COOKIE_MAX_AGE_ONE_DAY;

/**
 * A constant corresponding to 1 hour.
 *
 * For use with [ctor@Cookie.new] and [method@Cookie.set_max_age].
 */
enum COOKIE_MAX_AGE_ONE_HOUR = 3600;
alias SOUP_COOKIE_MAX_AGE_ONE_HOUR = COOKIE_MAX_AGE_ONE_HOUR;

/**
 * A constant corresponding to 1 week.
 *
 * For use with [ctor@Cookie.new] and [method@Cookie.set_max_age].
 */
enum COOKIE_MAX_AGE_ONE_WEEK = 0;
alias SOUP_COOKIE_MAX_AGE_ONE_WEEK = COOKIE_MAX_AGE_ONE_WEEK;

/**
 * A constant corresponding to 1 year.
 *
 * For use with [ctor@Cookie.new] and [method@Cookie.set_max_age].
 */
enum COOKIE_MAX_AGE_ONE_YEAR = 0;
alias SOUP_COOKIE_MAX_AGE_ONE_YEAR = COOKIE_MAX_AGE_ONE_YEAR;

/**
 * A macro containing the value
 * `multipart/form-data`; the MIME type used for
 * posting form data that contains files to be uploaded.
 */
enum FORM_MIME_TYPE_MULTIPART = "multipart/form-data";
alias SOUP_FORM_MIME_TYPE_MULTIPART = FORM_MIME_TYPE_MULTIPART;

/**
 * A macro containing the value
 * `application/x-www-form-urlencoded`; the default
 * MIME type for POSTing HTML form data.
 */
enum FORM_MIME_TYPE_URLENCODED = "application/x-www-form-urlencoded";
alias SOUP_FORM_MIME_TYPE_URLENCODED = FORM_MIME_TYPE_URLENCODED;

/**
 * An expiration date that is always in the past.
 */
enum HSTS_POLICY_MAX_AGE_PAST = 0;
alias SOUP_HSTS_POLICY_MAX_AGE_PAST = HSTS_POLICY_MAX_AGE_PAST;

/**
 * The set of #GUriFlags libsoup expects all #GUri to use.
 */
enum HTTP_URI_FLAGS = 482;
alias SOUP_HTTP_URI_FLAGS = HTTP_URI_FLAGS;

/**
 * Like [func@get_major_version], but from the headers used at application
 * compile time, rather than from the library linked against at application run
 * time.
 */
enum MAJOR_VERSION = 3;
alias SOUP_MAJOR_VERSION = MAJOR_VERSION;

/**
 * Like [func@get_micro_version], but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum MICRO_VERSION = 0;
alias SOUP_MICRO_VERSION = MICRO_VERSION;

/**
 * Like [func@get_minor_version], but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum MINOR_VERSION = 2;
alias SOUP_MINOR_VERSION = MINOR_VERSION;

/**
 * A macro that should be defined by the user prior to including
 * `libsoup.h`.
 *
 * The definition should be one of the predefined libsoup
 * version macros: %SOUP_VERSION_2_24, %SOUP_VERSION_2_26, ...
 *
 * This macro defines the earliest version of libsoup that the package
 * is required to be able to compile against.
 *
 * If the compiler is configured to warn about the use of deprecated
 * functions, then using functions that were deprecated in version
 * %SOUP_VERSION_MIN_REQUIRED or earlier will cause warnings (but
 * using functions deprecated in later releases will not).
 */
enum VERSION_MIN_REQUIRED = 2;
alias SOUP_VERSION_MIN_REQUIRED = VERSION_MIN_REQUIRED;
