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


module soup.c.functions;

import std.stdio;
import soup.c.types;
version (Windows)
	static immutable LIBRARY_SOUP = ["libsoup-3.0-0.dll;soup-3.0-0.dll;soup-3.dll"];
else version (OSX)
	static immutable LIBRARY_SOUP = ["libsoup-3.0.0.dylib"];
else
	static immutable LIBRARY_SOUP = ["libsoup-3.0.so.0"];

__gshared extern(C)
{

	// soup.Auth

	GType soup_auth_get_type();
	SoupAuth* soup_auth_new(GType type, SoupMessage* msg, const(char)* authHeader);
	void soup_auth_authenticate(SoupAuth* auth, const(char)* username, const(char)* password);
	int soup_auth_can_authenticate(SoupAuth* auth);
	void soup_auth_cancel(SoupAuth* auth);
	void soup_auth_free_protection_space(SoupAuth* auth, GSList* space);
	const(char)* soup_auth_get_authority(SoupAuth* auth);
	char* soup_auth_get_authorization(SoupAuth* auth, SoupMessage* msg);
	char* soup_auth_get_info(SoupAuth* auth);
	GSList* soup_auth_get_protection_space(SoupAuth* auth, GUri* sourceUri);
	const(char)* soup_auth_get_realm(SoupAuth* auth);
	const(char)* soup_auth_get_scheme_name(SoupAuth* auth);
	int soup_auth_is_authenticated(SoupAuth* auth);
	int soup_auth_is_cancelled(SoupAuth* auth);
	int soup_auth_is_for_proxy(SoupAuth* auth);
	int soup_auth_is_ready(SoupAuth* auth, SoupMessage* msg);
	int soup_auth_update(SoupAuth* auth, SoupMessage* msg, const(char)* authHeader);

	// soup.AuthBasic

	GType soup_auth_basic_get_type();

	// soup.AuthDigest

	GType soup_auth_digest_get_type();

	// soup.AuthDomain

	GType soup_auth_domain_get_type();
	char* soup_auth_domain_accepts(SoupAuthDomain* domain, SoupServerMessage* msg);
	void soup_auth_domain_add_path(SoupAuthDomain* domain, const(char)* path);
	void soup_auth_domain_challenge(SoupAuthDomain* domain, SoupServerMessage* msg);
	int soup_auth_domain_check_password(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, const(char)* password);
	int soup_auth_domain_covers(SoupAuthDomain* domain, SoupServerMessage* msg);
	const(char)* soup_auth_domain_get_realm(SoupAuthDomain* domain);
	void soup_auth_domain_remove_path(SoupAuthDomain* domain, const(char)* path);
	void soup_auth_domain_set_filter(SoupAuthDomain* domain, SoupAuthDomainFilter filter, void* filterData, GDestroyNotify dnotify);
	void soup_auth_domain_set_generic_auth_callback(SoupAuthDomain* domain, SoupAuthDomainGenericAuthCallback authCallback, void* authData, GDestroyNotify dnotify);

	// soup.AuthDomainBasic

	GType soup_auth_domain_basic_get_type();
	SoupAuthDomain* soup_auth_domain_basic_new(const(char)* optname1, ... );
	void soup_auth_domain_basic_set_auth_callback(SoupAuthDomain* domain, SoupAuthDomainBasicAuthCallback callback, void* userData, GDestroyNotify dnotify);

	// soup.AuthDomainDigest

	GType soup_auth_domain_digest_get_type();
	SoupAuthDomain* soup_auth_domain_digest_new(const(char)* optname1, ... );
	char* soup_auth_domain_digest_encode_password(const(char)* username, const(char)* realm, const(char)* password);
	void soup_auth_domain_digest_set_auth_callback(SoupAuthDomain* domain, SoupAuthDomainDigestAuthCallback callback, void* userData, GDestroyNotify dnotify);

	// soup.AuthManager

	GType soup_auth_manager_get_type();
	void soup_auth_manager_clear_cached_credentials(SoupAuthManager* manager);
	void soup_auth_manager_use_auth(SoupAuthManager* manager, GUri* uri, SoupAuth* auth);

	// soup.AuthNTLM

	GType soup_auth_ntlm_get_type();

	// soup.AuthNegotiate

	GType soup_auth_negotiate_get_type();
	int soup_auth_negotiate_supported();

	// soup.Cache

	GType soup_cache_get_type();
	SoupCache* soup_cache_new(const(char)* cacheDir, SoupCacheType cacheType);
	void soup_cache_clear(SoupCache* cache);
	void soup_cache_dump(SoupCache* cache);
	void soup_cache_flush(SoupCache* cache);
	uint soup_cache_get_max_size(SoupCache* cache);
	void soup_cache_load(SoupCache* cache);
	void soup_cache_set_max_size(SoupCache* cache, uint maxSize);

	// soup.ContentDecoder

	GType soup_content_decoder_get_type();

	// soup.ContentSniffer

	GType soup_content_sniffer_get_type();
	SoupContentSniffer* soup_content_sniffer_new();
	char* soup_content_sniffer_sniff(SoupContentSniffer* sniffer, SoupMessage* msg, GBytes* buffer, GHashTable** params);

	// soup.Cookie

	GType soup_cookie_get_type();
	SoupCookie* soup_cookie_new(const(char)* name, const(char)* value, const(char)* domain, const(char)* path, int maxAge);
	int soup_cookie_applies_to_uri(SoupCookie* cookie, GUri* uri);
	SoupCookie* soup_cookie_copy(SoupCookie* cookie);
	int soup_cookie_domain_matches(SoupCookie* cookie, const(char)* host);
	int soup_cookie_equal(SoupCookie* cookie1, SoupCookie* cookie2);
	void soup_cookie_free(SoupCookie* cookie);
	const(char)* soup_cookie_get_domain(SoupCookie* cookie);
	GDateTime* soup_cookie_get_expires(SoupCookie* cookie);
	int soup_cookie_get_http_only(SoupCookie* cookie);
	const(char)* soup_cookie_get_name(SoupCookie* cookie);
	const(char)* soup_cookie_get_path(SoupCookie* cookie);
	SoupSameSitePolicy soup_cookie_get_same_site_policy(SoupCookie* cookie);
	int soup_cookie_get_secure(SoupCookie* cookie);
	const(char)* soup_cookie_get_value(SoupCookie* cookie);
	void soup_cookie_set_domain(SoupCookie* cookie, const(char)* domain);
	void soup_cookie_set_expires(SoupCookie* cookie, GDateTime* expires);
	void soup_cookie_set_http_only(SoupCookie* cookie, int httpOnly);
	void soup_cookie_set_max_age(SoupCookie* cookie, int maxAge);
	void soup_cookie_set_name(SoupCookie* cookie, const(char)* name);
	void soup_cookie_set_path(SoupCookie* cookie, const(char)* path);
	void soup_cookie_set_same_site_policy(SoupCookie* cookie, SoupSameSitePolicy policy);
	void soup_cookie_set_secure(SoupCookie* cookie, int secure);
	void soup_cookie_set_value(SoupCookie* cookie, const(char)* value);
	char* soup_cookie_to_cookie_header(SoupCookie* cookie);
	char* soup_cookie_to_set_cookie_header(SoupCookie* cookie);
	SoupCookie* soup_cookie_parse(const(char)* header, GUri* origin);

	// soup.CookieJar

	GType soup_cookie_jar_get_type();
	SoupCookieJar* soup_cookie_jar_new();
	void soup_cookie_jar_add_cookie(SoupCookieJar* jar, SoupCookie* cookie);
	void soup_cookie_jar_add_cookie_full(SoupCookieJar* jar, SoupCookie* cookie, GUri* uri, GUri* firstParty);
	void soup_cookie_jar_add_cookie_with_first_party(SoupCookieJar* jar, GUri* firstParty, SoupCookie* cookie);
	GSList* soup_cookie_jar_all_cookies(SoupCookieJar* jar);
	void soup_cookie_jar_delete_cookie(SoupCookieJar* jar, SoupCookie* cookie);
	SoupCookieJarAcceptPolicy soup_cookie_jar_get_accept_policy(SoupCookieJar* jar);
	GSList* soup_cookie_jar_get_cookie_list(SoupCookieJar* jar, GUri* uri, int forHttp);
	GSList* soup_cookie_jar_get_cookie_list_with_same_site_info(SoupCookieJar* jar, GUri* uri, GUri* topLevel, GUri* siteForCookies, int forHttp, int isSafeMethod, int isTopLevelNavigation);
	char* soup_cookie_jar_get_cookies(SoupCookieJar* jar, GUri* uri, int forHttp);
	int soup_cookie_jar_is_persistent(SoupCookieJar* jar);
	void soup_cookie_jar_set_accept_policy(SoupCookieJar* jar, SoupCookieJarAcceptPolicy policy);
	void soup_cookie_jar_set_cookie(SoupCookieJar* jar, GUri* uri, const(char)* cookie);
	void soup_cookie_jar_set_cookie_with_first_party(SoupCookieJar* jar, GUri* uri, GUri* firstParty, const(char)* cookie);

	// soup.CookieJarDB

	GType soup_cookie_jar_db_get_type();
	SoupCookieJar* soup_cookie_jar_db_new(const(char)* filename, int readOnly);

	// soup.CookieJarText

	GType soup_cookie_jar_text_get_type();
	SoupCookieJar* soup_cookie_jar_text_new(const(char)* filename, int readOnly);

	// soup.HSTSEnforcer

	GType soup_hsts_enforcer_get_type();
	SoupHSTSEnforcer* soup_hsts_enforcer_new();
	GList* soup_hsts_enforcer_get_domains(SoupHSTSEnforcer* hstsEnforcer, int sessionPolicies);
	GList* soup_hsts_enforcer_get_policies(SoupHSTSEnforcer* hstsEnforcer, int sessionPolicies);
	int soup_hsts_enforcer_has_valid_policy(SoupHSTSEnforcer* hstsEnforcer, const(char)* domain);
	int soup_hsts_enforcer_is_persistent(SoupHSTSEnforcer* hstsEnforcer);
	void soup_hsts_enforcer_set_policy(SoupHSTSEnforcer* hstsEnforcer, SoupHSTSPolicy* policy);
	void soup_hsts_enforcer_set_session_policy(SoupHSTSEnforcer* hstsEnforcer, const(char)* domain, int includeSubdomains);

	// soup.HSTSEnforcerDB

	GType soup_hsts_enforcer_db_get_type();
	SoupHSTSEnforcer* soup_hsts_enforcer_db_new(const(char)* filename);

	// soup.HSTSPolicy

	GType soup_hsts_policy_get_type();
	SoupHSTSPolicy* soup_hsts_policy_new(const(char)* domain, ulong maxAge, int includeSubdomains);
	SoupHSTSPolicy* soup_hsts_policy_new_from_response(SoupMessage* msg);
	SoupHSTSPolicy* soup_hsts_policy_new_full(const(char)* domain, ulong maxAge, GDateTime* expires, int includeSubdomains);
	SoupHSTSPolicy* soup_hsts_policy_new_session_policy(const(char)* domain, int includeSubdomains);
	SoupHSTSPolicy* soup_hsts_policy_copy(SoupHSTSPolicy* policy);
	int soup_hsts_policy_equal(SoupHSTSPolicy* policy1, SoupHSTSPolicy* policy2);
	void soup_hsts_policy_free(SoupHSTSPolicy* policy);
	const(char)* soup_hsts_policy_get_domain(SoupHSTSPolicy* policy);
	GDateTime* soup_hsts_policy_get_expires(SoupHSTSPolicy* policy);
	gulong soup_hsts_policy_get_max_age(SoupHSTSPolicy* policy);
	int soup_hsts_policy_includes_subdomains(SoupHSTSPolicy* policy);
	int soup_hsts_policy_is_expired(SoupHSTSPolicy* policy);
	int soup_hsts_policy_is_session_policy(SoupHSTSPolicy* policy);

	// soup.Logger

	GType soup_logger_get_type();
	SoupLogger* soup_logger_new(SoupLoggerLogLevel level);
	int soup_logger_get_max_body_size(SoupLogger* logger);
	void soup_logger_set_max_body_size(SoupLogger* logger, int maxBodySize);
	void soup_logger_set_printer(SoupLogger* logger, SoupLoggerPrinter printer, void* printerData, GDestroyNotify destroy);
	void soup_logger_set_request_filter(SoupLogger* logger, SoupLoggerFilter requestFilter, void* filterData, GDestroyNotify destroy);
	void soup_logger_set_response_filter(SoupLogger* logger, SoupLoggerFilter responseFilter, void* filterData, GDestroyNotify destroy);

	// soup.Message

	GType soup_message_get_type();
	SoupMessage* soup_message_new(const(char)* method, const(char)* uriString);
	SoupMessage* soup_message_new_from_encoded_form(const(char)* method, const(char)* uriString, char* encodedForm);
	SoupMessage* soup_message_new_from_multipart(const(char)* uriString, SoupMultipart* multipart);
	SoupMessage* soup_message_new_from_uri(const(char)* method, GUri* uri);
	SoupMessage* soup_message_new_options_ping(GUri* baseUri);
	void soup_message_add_flags(SoupMessage* msg, SoupMessageFlags flags);
	uint soup_message_add_header_handler(SoupMessage* msg, const(char)* signal, const(char)* header, GCallback callback, void* userData);
	uint soup_message_add_status_code_handler(SoupMessage* msg, const(char)* signal, uint statusCode, GCallback callback, void* userData);
	void soup_message_disable_feature(SoupMessage* msg, GType featureType);
	ulong soup_message_get_connection_id(SoupMessage* msg);
	GUri* soup_message_get_first_party(SoupMessage* msg);
	SoupMessageFlags soup_message_get_flags(SoupMessage* msg);
	SoupHTTPVersion soup_message_get_http_version(SoupMessage* msg);
	int soup_message_get_is_options_ping(SoupMessage* msg);
	int soup_message_get_is_top_level_navigation(SoupMessage* msg);
	const(char)* soup_message_get_method(SoupMessage* msg);
	SoupMessageMetrics* soup_message_get_metrics(SoupMessage* msg);
	SoupMessagePriority soup_message_get_priority(SoupMessage* msg);
	const(char)* soup_message_get_reason_phrase(SoupMessage* msg);
	GSocketAddress* soup_message_get_remote_address(SoupMessage* msg);
	SoupMessageHeaders* soup_message_get_request_headers(SoupMessage* msg);
	SoupMessageHeaders* soup_message_get_response_headers(SoupMessage* msg);
	GUri* soup_message_get_site_for_cookies(SoupMessage* msg);
	SoupStatus soup_message_get_status(SoupMessage* msg);
	const(char)* soup_message_get_tls_ciphersuite_name(SoupMessage* msg);
	GTlsCertificate* soup_message_get_tls_peer_certificate(SoupMessage* msg);
	GTlsCertificateFlags soup_message_get_tls_peer_certificate_errors(SoupMessage* msg);
	GTlsProtocolVersion soup_message_get_tls_protocol_version(SoupMessage* msg);
	GUri* soup_message_get_uri(SoupMessage* msg);
	int soup_message_is_feature_disabled(SoupMessage* msg, GType featureType);
	int soup_message_is_keepalive(SoupMessage* msg);
	int soup_message_query_flags(SoupMessage* msg, SoupMessageFlags flags);
	void soup_message_remove_flags(SoupMessage* msg, SoupMessageFlags flags);
	void soup_message_set_first_party(SoupMessage* msg, GUri* firstParty);
	void soup_message_set_flags(SoupMessage* msg, SoupMessageFlags flags);
	void soup_message_set_is_options_ping(SoupMessage* msg, int isOptionsPing);
	void soup_message_set_is_top_level_navigation(SoupMessage* msg, int isTopLevelNavigation);
	void soup_message_set_method(SoupMessage* msg, const(char)* method);
	void soup_message_set_priority(SoupMessage* msg, SoupMessagePriority priority);
	void soup_message_set_request_body(SoupMessage* msg, const(char)* contentType, GInputStream* stream, ptrdiff_t contentLength);
	void soup_message_set_request_body_from_bytes(SoupMessage* msg, const(char)* contentType, GBytes* bytes);
	void soup_message_set_site_for_cookies(SoupMessage* msg, GUri* siteForCookies);
	void soup_message_set_tls_client_certificate(SoupMessage* msg, GTlsCertificate* certificate);
	void soup_message_set_uri(SoupMessage* msg, GUri* uri);
	void soup_message_tls_client_certificate_password_request_complete(SoupMessage* msg);

	// soup.MessageBody

	GType soup_message_body_get_type();
	SoupMessageBody* soup_message_body_new();
	void soup_message_body_append(SoupMessageBody* body_, SoupMemoryUse use, void* data, size_t length);
	void soup_message_body_append_bytes(SoupMessageBody* body_, GBytes* buffer);
	void soup_message_body_append_take(SoupMessageBody* body_, char* data, size_t length);
	void soup_message_body_complete(SoupMessageBody* body_);
	GBytes* soup_message_body_flatten(SoupMessageBody* body_);
	int soup_message_body_get_accumulate(SoupMessageBody* body_);
	GBytes* soup_message_body_get_chunk(SoupMessageBody* body_, long offset);
	void soup_message_body_got_chunk(SoupMessageBody* body_, GBytes* chunk);
	SoupMessageBody* soup_message_body_ref(SoupMessageBody* body_);
	void soup_message_body_set_accumulate(SoupMessageBody* body_, int accumulate);
	void soup_message_body_truncate(SoupMessageBody* body_);
	void soup_message_body_unref(SoupMessageBody* body_);
	void soup_message_body_wrote_chunk(SoupMessageBody* body_, GBytes* chunk);

	// soup.MessageHeaders

	GType soup_message_headers_get_type();
	SoupMessageHeaders* soup_message_headers_new(SoupMessageHeadersType type);
	void soup_message_headers_append(SoupMessageHeaders* hdrs, const(char)* name, const(char)* value);
	void soup_message_headers_clean_connection_headers(SoupMessageHeaders* hdrs);
	void soup_message_headers_clear(SoupMessageHeaders* hdrs);
	void soup_message_headers_foreach(SoupMessageHeaders* hdrs, SoupMessageHeadersForeachFunc func, void* userData);
	void soup_message_headers_free_ranges(SoupMessageHeaders* hdrs, SoupRange* ranges);
	int soup_message_headers_get_content_disposition(SoupMessageHeaders* hdrs, char** disposition, GHashTable** params);
	long soup_message_headers_get_content_length(SoupMessageHeaders* hdrs);
	int soup_message_headers_get_content_range(SoupMessageHeaders* hdrs, long* start, long* end, long* totalLength);
	const(char)* soup_message_headers_get_content_type(SoupMessageHeaders* hdrs, GHashTable** params);
	SoupEncoding soup_message_headers_get_encoding(SoupMessageHeaders* hdrs);
	SoupExpectation soup_message_headers_get_expectations(SoupMessageHeaders* hdrs);
	SoupMessageHeadersType soup_message_headers_get_headers_type(SoupMessageHeaders* hdrs);
	const(char)* soup_message_headers_get_list(SoupMessageHeaders* hdrs, const(char)* name);
	const(char)* soup_message_headers_get_one(SoupMessageHeaders* hdrs, const(char)* name);
	int soup_message_headers_get_ranges(SoupMessageHeaders* hdrs, long totalLength, SoupRange** ranges, int* length);
	int soup_message_headers_header_contains(SoupMessageHeaders* hdrs, const(char)* name, const(char)* token);
	int soup_message_headers_header_equals(SoupMessageHeaders* hdrs, const(char)* name, const(char)* value);
	SoupMessageHeaders* soup_message_headers_ref(SoupMessageHeaders* hdrs);
	void soup_message_headers_remove(SoupMessageHeaders* hdrs, const(char)* name);
	void soup_message_headers_replace(SoupMessageHeaders* hdrs, const(char)* name, const(char)* value);
	void soup_message_headers_set_content_disposition(SoupMessageHeaders* hdrs, const(char)* disposition, GHashTable* params);
	void soup_message_headers_set_content_length(SoupMessageHeaders* hdrs, long contentLength);
	void soup_message_headers_set_content_range(SoupMessageHeaders* hdrs, long start, long end, long totalLength);
	void soup_message_headers_set_content_type(SoupMessageHeaders* hdrs, const(char)* contentType, GHashTable* params);
	void soup_message_headers_set_encoding(SoupMessageHeaders* hdrs, SoupEncoding encoding);
	void soup_message_headers_set_expectations(SoupMessageHeaders* hdrs, SoupExpectation expectations);
	void soup_message_headers_set_range(SoupMessageHeaders* hdrs, long start, long end);
	void soup_message_headers_set_ranges(SoupMessageHeaders* hdrs, SoupRange* ranges, int length);
	void soup_message_headers_unref(SoupMessageHeaders* hdrs);

	// soup.MessageHeadersIter

	int soup_message_headers_iter_next(SoupMessageHeadersIter* iter, char** name, char** value);
	void soup_message_headers_iter_init(SoupMessageHeadersIter* iter, SoupMessageHeaders* hdrs);

	// soup.MessageMetrics

	GType soup_message_metrics_get_type();
	SoupMessageMetrics* soup_message_metrics_copy(SoupMessageMetrics* metrics);
	void soup_message_metrics_free(SoupMessageMetrics* metrics);
	ulong soup_message_metrics_get_connect_end(SoupMessageMetrics* metrics);
	ulong soup_message_metrics_get_connect_start(SoupMessageMetrics* metrics);
	ulong soup_message_metrics_get_dns_end(SoupMessageMetrics* metrics);
	ulong soup_message_metrics_get_dns_start(SoupMessageMetrics* metrics);
	ulong soup_message_metrics_get_fetch_start(SoupMessageMetrics* metrics);
	ulong soup_message_metrics_get_request_body_bytes_sent(SoupMessageMetrics* metrics);
	ulong soup_message_metrics_get_request_body_size(SoupMessageMetrics* metrics);
	ulong soup_message_metrics_get_request_header_bytes_sent(SoupMessageMetrics* metrics);
	ulong soup_message_metrics_get_request_start(SoupMessageMetrics* metrics);
	ulong soup_message_metrics_get_response_body_bytes_received(SoupMessageMetrics* metrics);
	ulong soup_message_metrics_get_response_body_size(SoupMessageMetrics* metrics);
	ulong soup_message_metrics_get_response_end(SoupMessageMetrics* metrics);
	ulong soup_message_metrics_get_response_header_bytes_received(SoupMessageMetrics* metrics);
	ulong soup_message_metrics_get_response_start(SoupMessageMetrics* metrics);
	ulong soup_message_metrics_get_tls_start(SoupMessageMetrics* metrics);

	// soup.Multipart

	GType soup_multipart_get_type();
	SoupMultipart* soup_multipart_new(const(char)* mimeType);
	SoupMultipart* soup_multipart_new_from_message(SoupMessageHeaders* headers, GBytes* body_);
	void soup_multipart_append_form_file(SoupMultipart* multipart, const(char)* controlName, const(char)* filename, const(char)* contentType, GBytes* body_);
	void soup_multipart_append_form_string(SoupMultipart* multipart, const(char)* controlName, const(char)* data);
	void soup_multipart_append_part(SoupMultipart* multipart, SoupMessageHeaders* headers, GBytes* body_);
	void soup_multipart_free(SoupMultipart* multipart);
	int soup_multipart_get_length(SoupMultipart* multipart);
	int soup_multipart_get_part(SoupMultipart* multipart, int part, SoupMessageHeaders** headers, GBytes** body_);
	void soup_multipart_to_message(SoupMultipart* multipart, SoupMessageHeaders* destHeaders, GBytes** destBody);

	// soup.MultipartInputStream

	GType soup_multipart_input_stream_get_type();
	SoupMultipartInputStream* soup_multipart_input_stream_new(SoupMessage* msg, GInputStream* baseStream);
	SoupMessageHeaders* soup_multipart_input_stream_get_headers(SoupMultipartInputStream* multipart);
	GInputStream* soup_multipart_input_stream_next_part(SoupMultipartInputStream* multipart, GCancellable* cancellable, GError** err);
	void soup_multipart_input_stream_next_part_async(SoupMultipartInputStream* multipart, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* data);
	GInputStream* soup_multipart_input_stream_next_part_finish(SoupMultipartInputStream* multipart, GAsyncResult* result, GError** err);

	// soup.Server

	GType soup_server_get_type();
	SoupServer* soup_server_new(const(char)* optname1, ... );
	int soup_server_accept_iostream(SoupServer* server, GIOStream* stream, GSocketAddress* localAddr, GSocketAddress* remoteAddr, GError** err);
	void soup_server_add_auth_domain(SoupServer* server, SoupAuthDomain* authDomain);
	void soup_server_add_early_handler(SoupServer* server, const(char)* path, SoupServerCallback callback, void* userData, GDestroyNotify destroy);
	void soup_server_add_handler(SoupServer* server, const(char)* path, SoupServerCallback callback, void* userData, GDestroyNotify destroy);
	void soup_server_add_websocket_extension(SoupServer* server, GType extensionType);
	void soup_server_add_websocket_handler(SoupServer* server, const(char)* path, const(char)* origin, char** protocols, SoupServerWebsocketCallback callback, void* userData, GDestroyNotify destroy);
	void soup_server_disconnect(SoupServer* server);
	GSList* soup_server_get_listeners(SoupServer* server);
	GTlsAuthenticationMode soup_server_get_tls_auth_mode(SoupServer* server);
	GTlsCertificate* soup_server_get_tls_certificate(SoupServer* server);
	GTlsDatabase* soup_server_get_tls_database(SoupServer* server);
	GSList* soup_server_get_uris(SoupServer* server);
	int soup_server_is_https(SoupServer* server);
	int soup_server_listen(SoupServer* server, GSocketAddress* address, SoupServerListenOptions options, GError** err);
	int soup_server_listen_all(SoupServer* server, uint port, SoupServerListenOptions options, GError** err);
	int soup_server_listen_local(SoupServer* server, uint port, SoupServerListenOptions options, GError** err);
	int soup_server_listen_socket(SoupServer* server, GSocket* socket, SoupServerListenOptions options, GError** err);
	void soup_server_pause_message(SoupServer* server, SoupServerMessage* msg);
	void soup_server_remove_auth_domain(SoupServer* server, SoupAuthDomain* authDomain);
	void soup_server_remove_handler(SoupServer* server, const(char)* path);
	void soup_server_remove_websocket_extension(SoupServer* server, GType extensionType);
	void soup_server_set_tls_auth_mode(SoupServer* server, GTlsAuthenticationMode mode);
	void soup_server_set_tls_certificate(SoupServer* server, GTlsCertificate* certificate);
	void soup_server_set_tls_database(SoupServer* server, GTlsDatabase* tlsDatabase);
	void soup_server_unpause_message(SoupServer* server, SoupServerMessage* msg);

	// soup.ServerMessage

	GType soup_server_message_get_type();
	SoupHTTPVersion soup_server_message_get_http_version(SoupServerMessage* msg);
	GSocketAddress* soup_server_message_get_local_address(SoupServerMessage* msg);
	const(char)* soup_server_message_get_method(SoupServerMessage* msg);
	const(char)* soup_server_message_get_reason_phrase(SoupServerMessage* msg);
	GSocketAddress* soup_server_message_get_remote_address(SoupServerMessage* msg);
	const(char)* soup_server_message_get_remote_host(SoupServerMessage* msg);
	SoupMessageBody* soup_server_message_get_request_body(SoupServerMessage* msg);
	SoupMessageHeaders* soup_server_message_get_request_headers(SoupServerMessage* msg);
	SoupMessageBody* soup_server_message_get_response_body(SoupServerMessage* msg);
	SoupMessageHeaders* soup_server_message_get_response_headers(SoupServerMessage* msg);
	GSocket* soup_server_message_get_socket(SoupServerMessage* msg);
	uint soup_server_message_get_status(SoupServerMessage* msg);
	GTlsCertificate* soup_server_message_get_tls_peer_certificate(SoupServerMessage* msg);
	GTlsCertificateFlags soup_server_message_get_tls_peer_certificate_errors(SoupServerMessage* msg);
	GUri* soup_server_message_get_uri(SoupServerMessage* msg);
	int soup_server_message_is_options_ping(SoupServerMessage* msg);
	void soup_server_message_pause(SoupServerMessage* msg);
	void soup_server_message_set_http_version(SoupServerMessage* msg, SoupHTTPVersion version_);
	void soup_server_message_set_redirect(SoupServerMessage* msg, uint statusCode, const(char)* redirectUri);
	void soup_server_message_set_response(SoupServerMessage* msg, const(char)* contentType, SoupMemoryUse respUse, char* respBody, size_t respLength);
	void soup_server_message_set_status(SoupServerMessage* msg, uint statusCode, const(char)* reasonPhrase);
	GIOStream* soup_server_message_steal_connection(SoupServerMessage* msg);
	void soup_server_message_unpause(SoupServerMessage* msg);

	// soup.Session

	GType soup_session_get_type();
	SoupSession* soup_session_new();
	SoupSession* soup_session_new_with_options(const(char)* optname1, ... );
	void soup_session_abort(SoupSession* session);
	void soup_session_add_feature(SoupSession* session, SoupSessionFeature* feature);
	void soup_session_add_feature_by_type(SoupSession* session, GType featureType);
	const(char)* soup_session_get_accept_language(SoupSession* session);
	int soup_session_get_accept_language_auto(SoupSession* session);
	SoupMessage* soup_session_get_async_result_message(SoupSession* session, GAsyncResult* result);
	SoupSessionFeature* soup_session_get_feature(SoupSession* session, GType featureType);
	SoupSessionFeature* soup_session_get_feature_for_message(SoupSession* session, GType featureType, SoupMessage* msg);
	uint soup_session_get_idle_timeout(SoupSession* session);
	GInetSocketAddress* soup_session_get_local_address(SoupSession* session);
	uint soup_session_get_max_conns(SoupSession* session);
	uint soup_session_get_max_conns_per_host(SoupSession* session);
	GProxyResolver* soup_session_get_proxy_resolver(SoupSession* session);
	GSocketConnectable* soup_session_get_remote_connectable(SoupSession* session);
	uint soup_session_get_timeout(SoupSession* session);
	GTlsDatabase* soup_session_get_tls_database(SoupSession* session);
	GTlsInteraction* soup_session_get_tls_interaction(SoupSession* session);
	const(char)* soup_session_get_user_agent(SoupSession* session);
	int soup_session_has_feature(SoupSession* session, GType featureType);
	void soup_session_preconnect_async(SoupSession* session, SoupMessage* msg, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData);
	int soup_session_preconnect_finish(SoupSession* session, GAsyncResult* result, GError** err);
	void soup_session_remove_feature(SoupSession* session, SoupSessionFeature* feature);
	void soup_session_remove_feature_by_type(SoupSession* session, GType featureType);
	GInputStream* soup_session_send(SoupSession* session, SoupMessage* msg, GCancellable* cancellable, GError** err);
	GBytes* soup_session_send_and_read(SoupSession* session, SoupMessage* msg, GCancellable* cancellable, GError** err);
	void soup_session_send_and_read_async(SoupSession* session, SoupMessage* msg, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData);
	GBytes* soup_session_send_and_read_finish(SoupSession* session, GAsyncResult* result, GError** err);
	void soup_session_send_async(SoupSession* session, SoupMessage* msg, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData);
	GInputStream* soup_session_send_finish(SoupSession* session, GAsyncResult* result, GError** err);
	void soup_session_set_accept_language(SoupSession* session, const(char)* acceptLanguage);
	void soup_session_set_accept_language_auto(SoupSession* session, int acceptLanguageAuto);
	void soup_session_set_idle_timeout(SoupSession* session, uint timeout);
	void soup_session_set_proxy_resolver(SoupSession* session, GProxyResolver* proxyResolver);
	void soup_session_set_timeout(SoupSession* session, uint timeout);
	void soup_session_set_tls_database(SoupSession* session, GTlsDatabase* tlsDatabase);
	void soup_session_set_tls_interaction(SoupSession* session, GTlsInteraction* tlsInteraction);
	void soup_session_set_user_agent(SoupSession* session, const(char)* userAgent);
	void soup_session_websocket_connect_async(SoupSession* session, SoupMessage* msg, const(char)* origin, char** protocols, int ioPriority, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData);
	SoupWebsocketConnection* soup_session_websocket_connect_finish(SoupSession* session, GAsyncResult* result, GError** err);

	// soup.SessionFeature

	GType soup_session_feature_get_type();

	// soup.WebsocketConnection

	GType soup_websocket_connection_get_type();
	SoupWebsocketConnection* soup_websocket_connection_new(GIOStream* stream, GUri* uri, SoupWebsocketConnectionType type, const(char)* origin, const(char)* protocol, GList* extensions);
	void soup_websocket_connection_close(SoupWebsocketConnection* self, ushort code, const(char)* data);
	ushort soup_websocket_connection_get_close_code(SoupWebsocketConnection* self);
	const(char)* soup_websocket_connection_get_close_data(SoupWebsocketConnection* self);
	SoupWebsocketConnectionType soup_websocket_connection_get_connection_type(SoupWebsocketConnection* self);
	GList* soup_websocket_connection_get_extensions(SoupWebsocketConnection* self);
	GIOStream* soup_websocket_connection_get_io_stream(SoupWebsocketConnection* self);
	uint soup_websocket_connection_get_keepalive_interval(SoupWebsocketConnection* self);
	ulong soup_websocket_connection_get_max_incoming_payload_size(SoupWebsocketConnection* self);
	const(char)* soup_websocket_connection_get_origin(SoupWebsocketConnection* self);
	const(char)* soup_websocket_connection_get_protocol(SoupWebsocketConnection* self);
	SoupWebsocketState soup_websocket_connection_get_state(SoupWebsocketConnection* self);
	GUri* soup_websocket_connection_get_uri(SoupWebsocketConnection* self);
	void soup_websocket_connection_send_binary(SoupWebsocketConnection* self, void* data, size_t length);
	void soup_websocket_connection_send_message(SoupWebsocketConnection* self, SoupWebsocketDataType type, GBytes* message);
	void soup_websocket_connection_send_text(SoupWebsocketConnection* self, const(char)* text);
	void soup_websocket_connection_set_keepalive_interval(SoupWebsocketConnection* self, uint interval);
	void soup_websocket_connection_set_max_incoming_payload_size(SoupWebsocketConnection* self, ulong maxIncomingPayloadSize);

	// soup.WebsocketExtension

	GType soup_websocket_extension_get_type();
	int soup_websocket_extension_configure(SoupWebsocketExtension* extension, SoupWebsocketConnectionType connectionType, GHashTable* params, GError** err);
	char* soup_websocket_extension_get_request_params(SoupWebsocketExtension* extension);
	char* soup_websocket_extension_get_response_params(SoupWebsocketExtension* extension);
	GBytes* soup_websocket_extension_process_incoming_message(SoupWebsocketExtension* extension, ubyte* header, GBytes* payload, GError** err);
	GBytes* soup_websocket_extension_process_outgoing_message(SoupWebsocketExtension* extension, ubyte* header, GBytes* payload, GError** err);

	// soup.WebsocketExtensionDeflate

	GType soup_websocket_extension_deflate_get_type();

	// soup.WebsocketExtensionManager

	GType soup_websocket_extension_manager_get_type();
}