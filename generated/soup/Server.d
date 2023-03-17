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


module soup.Server;

private import gio.IOStream;
private import gio.Socket;
private import gio.SocketAddress;
private import gio.TlsCertificate;
private import gio.TlsDatabase;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.ListSG;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import soup.AuthDomain;
private import soup.ServerMessage;
private import soup.c.functions;
public  import soup.c.types;
private import std.algorithm;


/**
 * A HTTP server.
 * 
 * #SoupServer implements a simple HTTP server.
 * 
 * To begin, create a server using [ctor@Server.new]. Add at least one
 * handler by calling [method@Server.add_handler] or
 * [method@Server.add_early_handler]; the handler will be called to
 * process any requests underneath the path you pass. (If you want all
 * requests to go to the same handler, just pass "/" (or %NULL) for
 * the path.)
 * 
 * When a new connection is accepted (or a new request is started on
 * an existing persistent connection), the #SoupServer will emit
 * [signal@Server::request-started] and then begin processing the request
 * as described below, but note that once the message is assigned a
 * status-code, then callbacks after that point will be
 * skipped. Note also that it is not defined when the callbacks happen
 * relative to various [class@ServerMessage] signals.
 * 
 * Once the headers have been read, #SoupServer will check if there is
 * a [class@AuthDomain] `(qv)` covering the Request-URI; if so, and if the
 * message does not contain suitable authorization, then the
 * [class@AuthDomain] will set a status of %SOUP_STATUS_UNAUTHORIZED on
 * the message.
 * 
 * After checking for authorization, #SoupServer will look for "early"
 * handlers (added with [method@Server.add_early_handler]) matching the
 * Request-URI. If one is found, it will be run; in particular, this
 * can be used to connect to signals to do a streaming read of the
 * request body.
 * 
 * (At this point, if the request headers contain `Expect:
 * 100-continue`, and a status code has been set, then
 * #SoupServer will skip the remaining steps and return the response.
 * If the request headers contain `Expect:
 * 100-continue` and no status code has been set,
 * #SoupServer will return a %SOUP_STATUS_CONTINUE status before
 * continuing.)
 * 
 * The server will then read in the response body (if present). At
 * this point, if there are no handlers at all defined for the
 * Request-URI, then the server will return %SOUP_STATUS_NOT_FOUND to
 * the client.
 * 
 * Otherwise (assuming no previous step assigned a status to the
 * message) any "normal" handlers (added with
 * [method@Server.add_handler]) for the message's Request-URI will be
 * run.
 * 
 * Then, if the path has a WebSocket handler registered (and has
 * not yet been assigned a status), #SoupServer will attempt to
 * validate the WebSocket handshake, filling in the response and
 * setting a status of %SOUP_STATUS_SWITCHING_PROTOCOLS or
 * %SOUP_STATUS_BAD_REQUEST accordingly.
 * 
 * If the message still has no status code at this point (and has not
 * been paused with [method@ServerMessage.pause]), then it will be
 * given a status of %SOUP_STATUS_INTERNAL_SERVER_ERROR (because at
 * least one handler ran, but returned without assigning a status).
 * 
 * Finally, the server will emit [signal@Server::request-finished] (or
 * [signal@Server::request-aborted] if an I/O error occurred before
 * handling was completed).
 * 
 * If you want to handle the special "*" URI (eg, "OPTIONS *"), you
 * must explicitly register a handler for "*"; the default handler
 * will not be used for that case.
 * 
 * If you want to process https connections in addition to (or instead
 * of) http connections, you can set the [property@Server:tls-certificate]
 * property.
 * 
 * Once the server is set up, make one or more calls to
 * [method@Server.listen], [method@Server.listen_local], or
 * [method@Server.listen_all] to tell it where to listen for
 * connections. (All ports on a #SoupServer use the same handlers; if
 * you need to handle some ports differently, such as returning
 * different data for http and https, you'll need to create multiple
 * `SoupServer`s, or else check the passed-in URI in the handler
 * function.).
 * 
 * #SoupServer will begin processing connections as soon as you return
 * to (or start) the main loop for the current thread-default
 * [struct@GLib.MainContext].
 */
public class Server : ObjectG
{
	/** the main Gtk struct */
	protected SoupServer* soupServer;

	/** Get the main Gtk struct */
	public SoupServer* getServerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupServer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)soupServer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupServer* soupServer, bool ownedRef = false)
	{
		this.soupServer = soupServer;
		super(cast(GObject*)soupServer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return soup_server_get_type();
	}

	/**
	 * Adds a new client stream to the @server.
	 *
	 * Params:
	 *     stream = a #GIOStream
	 *     localAddr = the local #GSocketAddress associated with the
	 *         @stream
	 *     remoteAddr = the remote #GSocketAddress associated with the
	 *         @stream
	 *
	 * Returns: %TRUE on success, %FALSE if the stream could not be
	 *     accepted or any other error occurred (in which case @error will be
	 *     set).
	 *
	 * Throws: GException on failure.
	 */
	public bool acceptIostream(IOStream stream, SocketAddress localAddr, SocketAddress remoteAddr)
	{
		GError* err = null;

		auto __p = soup_server_accept_iostream(soupServer, (stream is null) ? null : stream.getIOStreamStruct(), (localAddr is null) ? null : localAddr.getSocketAddressStruct(), (remoteAddr is null) ? null : remoteAddr.getSocketAddressStruct(), &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}

	/**
	 * Adds an authentication domain to @server.
	 *
	 * Each auth domain will have the chance to require authentication for each
	 * request that comes in; normally auth domains will require authentication for
	 * requests on certain paths that they have been set up to watch, or that meet
	 * other criteria set by the caller. If an auth domain determines that a request
	 * requires authentication (and the request doesn't contain authentication),
	 * @server will automatically reject the request with an appropriate status (401
	 * Unauthorized or 407 Proxy Authentication Required). If the request used the
	 * SoupServer:100-continue Expectation, @server will reject it before the
	 * request body is sent.
	 *
	 * Params:
	 *     authDomain = a #SoupAuthDomain
	 */
	public void addAuthDomain(AuthDomain authDomain)
	{
		soup_server_add_auth_domain(soupServer, (authDomain is null) ? null : authDomain.getAuthDomainStruct());
	}

	/**
	 * Adds an "early" handler to @server for requests prefixed by @path.
	 *
	 * Note that "normal" and "early" handlers are matched up together, so if you
	 * add a normal handler for "/foo" and an early handler for "/foo/bar", then a
	 * request to "/foo/bar" (or any path below it) will run only the early handler.
	 * (But if you add both handlers at the same path, then both will get run.)
	 *
	 * For requests under @path (that have not already been assigned a
	 * status code by a [class@AuthDomain] or a signal handler), @callback
	 * will be invoked after receiving the request headers, but before
	 * receiving the request body; the message's method and
	 * request-headers properties will be set.
	 *
	 * Early handlers are generally used for processing requests with request bodies
	 * in a streaming fashion. If you determine that the request will contain a
	 * message body, normally you would call [method@MessageBody.set_accumulate] on
	 * the message's request-body to turn off request-body accumulation, and connect
	 * to the message's [signal@ServerMessage::got-chunk] signal to process each
	 * chunk as it comes in.
	 *
	 * To complete the message processing after the full message body has
	 * been read, you can either also connect to [signal@ServerMessage::got-body],
	 * or else you can register a non-early handler for @path as well. As
	 * long as you have not set the status-code by the time
	 * [signal@ServerMessage::got-body] is emitted, the non-early handler will be
	 * run as well.
	 *
	 * Params:
	 *     path = the toplevel path for the handler
	 *     callback = callback to invoke for
	 *         requests under @path
	 *     userData = data for @callback
	 *     destroy = destroy notifier to free @user_data
	 */
	public void addEarlyHandler(string path, SoupServerCallback callback, void* userData, GDestroyNotify destroy)
	{
		soup_server_add_early_handler(soupServer, Str.toStringz(path), callback, userData, destroy);
	}

	/**
	 * Adds a handler to @server for requests prefixed by @path.
	 *
	 * If @path is %NULL or "/", then this will be the default handler for all
	 * requests that don't have a more specific handler. (Note though that if you
	 * want to handle requests to the special "*" URI, you must explicitly register
	 * a handler for "*"; the default handler will not be used for that case.)
	 *
	 * For requests under @path (that have not already been assigned a
	 * status code by a [class@AuthDomain], an early server handler, or a
	 * signal handler), @callback will be invoked after receiving the
	 * request body; the [class@ServerMessage]'s method, request-headers,
	 * and request-body properties will be set.
	 *
	 * After determining what to do with the request, the callback must at a minimum
	 * call [method@ServerMessage.set_status] on the message to set the response
	 * status code. Additionally, it may set response headers and/or fill in the
	 * response body.
	 *
	 * If the callback cannot fully fill in the response before returning
	 * (eg, if it needs to wait for information from a database, or
	 * another network server), it should call [method@ServerMessage.pause]
	 * to tell @server to not send the response right away. When the
	 * response is ready, call [method@ServerMessage.unpause] to cause it
	 * to be sent.
	 *
	 * To send the response body a bit at a time using "chunked" encoding, first
	 * call [method@MessageHeaders.set_encoding] to set %SOUP_ENCODING_CHUNKED on
	 * the response-headers. Then call [method@MessageBody.append] (or
	 * [method@MessageBody.append_bytes])) to append each chunk as it becomes ready,
	 * and [method@ServerMessage.unpause] to make sure it's running. (The server
	 * will automatically pause the message if it is using chunked encoding but no
	 * more chunks are available.) When you are done, call
	 * [method@MessageBody.complete] to indicate that no more chunks are coming.
	 *
	 * Params:
	 *     path = the toplevel path for the handler
	 *     callback = callback to invoke for
	 *         requests under @path
	 *     userData = data for @callback
	 *     destroy = destroy notifier to free @user_data
	 */
	public void addHandler(string path, SoupServerCallback callback, void* userData, GDestroyNotify destroy)
	{
		soup_server_add_handler(soupServer, Str.toStringz(path), callback, userData, destroy);
	}

	/**
	 * Add support for a WebSocket extension of the given @extension_type.
	 *
	 * When a WebSocket client requests an extension of @extension_type,
	 * a new [class@WebsocketExtension] of type @extension_type will be created
	 * to handle the request.
	 *
	 * Note that [class@WebsocketExtensionDeflate] is supported by default, use
	 * [method@Server.remove_websocket_extension] if you want to disable it.
	 *
	 * Params:
	 *     extensionType = a #GType
	 */
	public void addWebsocketExtension(GType extensionType)
	{
		soup_server_add_websocket_extension(soupServer, extensionType);
	}

	/**
	 * Adds a WebSocket handler to @server for requests prefixed by @path.
	 *
	 * If @path is %NULL or "/", then this will be the default handler for all
	 * requests that don't have a more specific handler.
	 *
	 * When a path has a WebSocket handler registered, @server will check
	 * incoming requests for WebSocket handshakes after all other handlers
	 * have run (unless some earlier handler has already set a status code
	 * on the message), and update the request's status, response headers,
	 * and response body accordingly.
	 *
	 * If @origin is non-%NULL, then only requests containing a matching
	 * "Origin" header will be accepted. If @protocols is non-%NULL, then
	 * only requests containing a compatible "Sec-WebSocket-Protocols"
	 * header will be accepted. More complicated requirements can be
	 * handled by adding a normal handler to @path, and having it perform
	 * whatever checks are needed and
	 * setting a failure status code if the handshake should be rejected.
	 *
	 * Params:
	 *     path = the toplevel path for the handler
	 *     origin = the origin of the connection
	 *     protocols = the protocols
	 *         supported by this handler
	 *     callback = callback to invoke for
	 *         successful WebSocket requests under @path
	 *     userData = data for @callback
	 *     destroy = destroy notifier to free @user_data
	 */
	public void addWebsocketHandler(string path, string origin, string[] protocols, SoupServerWebsocketCallback callback, void* userData, GDestroyNotify destroy)
	{
		soup_server_add_websocket_handler(soupServer, Str.toStringz(path), Str.toStringz(origin), Str.toStringzArray(protocols), callback, userData, destroy);
	}

	/**
	 * Closes and frees @server's listening sockets.
	 *
	 * Note that if there are currently requests in progress on @server, that they
	 * will continue to be processed if @server's [struct@GLib.MainContext] is still
	 * running.
	 *
	 * You can call [method@Server.listen], etc, after calling this function
	 * if you want to start listening again.
	 */
	public void disconnect()
	{
		soup_server_disconnect(soupServer);
	}

	/**
	 * Gets @server's list of listening sockets.
	 *
	 * You should treat these sockets as read-only; writing to or
	 * modifiying any of these sockets may cause @server to malfunction.
	 *
	 * Returns: a
	 *     list of listening sockets.
	 */
	public ListSG getListeners()
	{
		auto __p = soup_server_get_listeners(soupServer);

		if(__p is null)
		{
			return null;
		}

		return new ListSG(cast(GSList*) __p);
	}

	/**
	 * Gets the @server SSL/TLS client authentication mode.
	 *
	 * Returns: a #GTlsAuthenticationMode
	 */
	public GTlsAuthenticationMode getTlsAuthMode()
	{
		return soup_server_get_tls_auth_mode(soupServer);
	}

	/**
	 * Gets the @server SSL/TLS certificate.
	 *
	 * Returns: a #GTlsCertificate or %NULL
	 */
	public TlsCertificate getTlsCertificate()
	{
		auto __p = soup_server_get_tls_certificate(soupServer);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TlsCertificate)(cast(GTlsCertificate*) __p);
	}

	/**
	 * Gets the @server SSL/TLS database.
	 *
	 * Returns: a #GTlsDatabase
	 */
	public TlsDatabase getTlsDatabase()
	{
		auto __p = soup_server_get_tls_database(soupServer);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TlsDatabase)(cast(GTlsDatabase*) __p);
	}

	/**
	 * Gets a list of URIs corresponding to the interfaces @server is
	 * listening on.
	 *
	 * These will contain IP addresses, not hostnames, and will also indicate
	 * whether the given listener is http or https.
	 *
	 * Note that if you used [method@Server.listen_all] the returned URIs will use
	 * the addresses `0.0.0.0` and `::`, rather than actually returning separate
	 * URIs for each interface on the system.
	 *
	 * Returns: a list of #GUris, which you
	 *     must free when you are done with it.
	 */
	public ListSG getUris()
	{
		auto __p = soup_server_get_uris(soupServer);

		if(__p is null)
		{
			return null;
		}

		return new ListSG(cast(GSList*) __p, true);
	}

	/**
	 * Checks whether @server is capable of https.
	 *
	 * In order for a server to run https, you must call
	 * [method@Server.set_tls_certificate], or set the
	 * [property@Server:tls-certificate] property, to provide it with a
	 * certificate to use.
	 *
	 * If you are using the deprecated single-listener APIs, then a return value of
	 * %TRUE indicates that the #SoupServer serves https exclusively. If you are
	 * using [method@Server.listen], etc, then a %TRUE return value merely indicates
	 * that the server is *able* to do https, regardless of whether it actually
	 * currently is or not. Use [method@Server.get_uris] to see if it currently has
	 * any https listeners.
	 *
	 * Returns: %TRUE if @server is configured to serve https.
	 */
	public bool isHttps()
	{
		return soup_server_is_https(soupServer) != 0;
	}

	/**
	 * Attempts to set up @server to listen for connections on @address.
	 *
	 * If @options includes %SOUP_SERVER_LISTEN_HTTPS, and @server has
	 * been configured for TLS, then @server will listen for https
	 * connections on this port. Otherwise it will listen for plain http.
	 *
	 * You may call this method (along with the other "listen" methods)
	 * any number of times on a server, if you want to listen on multiple
	 * ports, or set up both http and https service.
	 *
	 * After calling this method, @server will begin accepting and processing
	 * connections as soon as the appropriate [struct@GLib.MainContext] is run.
	 *
	 * Note that this API does not make use of dual IPv4/IPv6 sockets; if
	 * @address is an IPv6 address, it will only accept IPv6 connections.
	 * You must configure IPv4 listening separately.
	 *
	 * Params:
	 *     address = the address of the interface to listen on
	 *     options = listening options for this server
	 *
	 * Returns: %TRUE on success, %FALSE if @address could not be
	 *     bound or any other error occurred (in which case @error will be
	 *     set).
	 *
	 * Throws: GException on failure.
	 */
	public bool listen(SocketAddress address, SoupServerListenOptions options)
	{
		GError* err = null;

		auto __p = soup_server_listen(soupServer, (address is null) ? null : address.getSocketAddressStruct(), options, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}

	/**
	 * Attempts to set up @server to listen for connections on all interfaces
	 * on the system.
	 *
	 * That is, it listens on the addresses `0.0.0.0` and/or `::`, depending on
	 * whether @options includes %SOUP_SERVER_LISTEN_IPV4_ONLY,
	 * %SOUP_SERVER_LISTEN_IPV6_ONLY, or neither.) If @port is specified, @server
	 * will listen on that port. If it is 0, @server will find an unused port to
	 * listen on. (In that case, you can use [method@Server.get_uris] to find out
	 * what port it ended up choosing.
	 *
	 * See [method@Server.listen] for more details.
	 *
	 * Params:
	 *     port = the port to listen on, or 0
	 *     options = listening options for this server
	 *
	 * Returns: %TRUE on success, %FALSE if @port could not be bound
	 *     or any other error occurred (in which case @error will be set).
	 *
	 * Throws: GException on failure.
	 */
	public bool listenAll(uint port, SoupServerListenOptions options)
	{
		GError* err = null;

		auto __p = soup_server_listen_all(soupServer, port, options, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}

	/**
	 * Attempts to set up @server to listen for connections on "localhost".
	 *
	 * That is, `127.0.0.1` and/or `::1`, depending on whether @options includes
	 * %SOUP_SERVER_LISTEN_IPV4_ONLY, %SOUP_SERVER_LISTEN_IPV6_ONLY, or neither). If
	 * @port is specified, @server will listen on that port. If it is 0, @server
	 * will find an unused port to listen on. (In that case, you can use
	 * [method@Server.get_uris] to find out what port it ended up choosing.
	 *
	 * See [method@Server.listen] for more details.
	 *
	 * Params:
	 *     port = the port to listen on, or 0
	 *     options = listening options for this server
	 *
	 * Returns: %TRUE on success, %FALSE if @port could not be bound
	 *     or any other error occurred (in which case @error will be set).
	 *
	 * Throws: GException on failure.
	 */
	public bool listenLocal(uint port, SoupServerListenOptions options)
	{
		GError* err = null;

		auto __p = soup_server_listen_local(soupServer, port, options, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}

	/**
	 * Attempts to set up @server to listen for connections on @socket.
	 *
	 * See [method@Server.listen] for more details.
	 *
	 * Params:
	 *     socket = a listening #GSocket
	 *     options = listening options for this server
	 *
	 * Returns: %TRUE on success, %FALSE if an error occurred (in
	 *     which case @error will be set).
	 *
	 * Throws: GException on failure.
	 */
	public bool listenSocket(Socket socket, SoupServerListenOptions options)
	{
		GError* err = null;

		auto __p = soup_server_listen_socket(soupServer, (socket is null) ? null : socket.getSocketStruct(), options, &err) != 0;

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return __p;
	}

	/**
	 * Pauses I/O on @msg.
	 *
	 * This can be used when you need to return from the server handler without
	 * having the full response ready yet. Use [method@Server.unpause_message] to
	 * resume I/O.
	 *
	 * This must only be called on a [class@ServerMessage] which was created by the
	 * #SoupServer and are currently doing I/O, such as those passed into a
	 * [callback@ServerCallback] or emitted in a [signal@Server::request-read]
	 * signal.
	 *
	 * Deprecated: Use soup_server_message_pause() instead.
	 *
	 * Params:
	 *     msg = a #SoupServerMessage associated with @server.
	 */
	public void pauseMessage(ServerMessage msg)
	{
		soup_server_pause_message(soupServer, (msg is null) ? null : msg.getServerMessageStruct());
	}

	/**
	 * Removes @auth_domain from @server.
	 *
	 * Params:
	 *     authDomain = a #SoupAuthDomain
	 */
	public void removeAuthDomain(AuthDomain authDomain)
	{
		soup_server_remove_auth_domain(soupServer, (authDomain is null) ? null : authDomain.getAuthDomainStruct());
	}

	/**
	 * Removes all handlers (early and normal) registered at @path.
	 *
	 * Params:
	 *     path = the toplevel path for the handler
	 */
	public void removeHandler(string path)
	{
		soup_server_remove_handler(soupServer, Str.toStringz(path));
	}

	/**
	 * Removes support for WebSocket extension of type @extension_type (or any subclass of
	 * @extension_type) from @server.
	 *
	 * Params:
	 *     extensionType = a #GType
	 */
	public void removeWebsocketExtension(GType extensionType)
	{
		soup_server_remove_websocket_extension(soupServer, extensionType);
	}

	/**
	 * Sets @server's #GTlsAuthenticationMode to use for SSL/TLS client authentication.
	 *
	 * Params:
	 *     mode = a #GTlsAuthenticationMode
	 */
	public void setTlsAuthMode(GTlsAuthenticationMode mode)
	{
		soup_server_set_tls_auth_mode(soupServer, mode);
	}

	/**
	 * Sets @server up to do https, using the given SSL/TLS @certificate.
	 *
	 * Params:
	 *     certificate = a #GTlsCertificate
	 */
	public void setTlsCertificate(TlsCertificate certificate)
	{
		soup_server_set_tls_certificate(soupServer, (certificate is null) ? null : certificate.getTlsCertificateStruct());
	}

	/**
	 * Sets @server's #GTlsDatabase to use for validating SSL/TLS client certificates.
	 *
	 * Params:
	 *     tlsDatabase = a #GTlsDatabase
	 */
	public void setTlsDatabase(TlsDatabase tlsDatabase)
	{
		soup_server_set_tls_database(soupServer, (tlsDatabase is null) ? null : tlsDatabase.getTlsDatabaseStruct());
	}

	/**
	 * Resumes I/O on @msg.
	 *
	 * Use this to resume after calling [method@Server.pause_message], or after
	 * adding a new chunk to a chunked response.
	 *
	 * I/O won't actually resume until you return to the main loop.
	 *
	 * This must only be called on a [class@ServerMessage] which was created by the
	 * #SoupServer and are currently doing I/O, such as those passed into a
	 * [callback@ServerCallback] or emitted in a [signal@Server::request-read]
	 * signal.
	 *
	 * Deprecated: Use soup_server_message_unpause() instead.
	 *
	 * Params:
	 *     msg = a #SoupServerMessage associated with @server.
	 */
	public void unpauseMessage(ServerMessage msg)
	{
		soup_server_unpause_message(soupServer, (msg is null) ? null : msg.getServerMessageStruct());
	}

	/**
	 * Emitted when processing has failed for a message.
	 *
	 * This could mean either that it could not be read (if
	 * [signal@Server::request-read] has not been emitted for it yet), or that
	 * the response could not be written back (if [signal@Server::request-read]
	 * has been emitted but [signal@Server::request-finished] has not been).
	 *
	 * @message is in an undefined state when this signal is
	 * emitted; the signal exists primarily to allow the server to
	 * free any state that it may have allocated in
	 * [signal@Server::request-started].
	 *
	 * Params:
	 *     message = the message
	 */
	gulong addOnRequestAborted(void delegate(ServerMessage, Server) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "request-aborted", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when the server has finished writing a response to
	 * a request.
	 *
	 * Params:
	 *     message = the message
	 */
	gulong addOnRequestFinished(void delegate(ServerMessage, Server) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "request-finished", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when the server has successfully read a request.
	 *
	 * @message will have all of its request-side information
	 * filled in, and if the message was authenticated, @client
	 * will have information about that. This signal is emitted
	 * before any (non-early) handlers are called for the message,
	 * and if it sets the message's #status_code, then normal
	 * handler processing will be skipped.
	 *
	 * Params:
	 *     message = the message
	 */
	gulong addOnRequestRead(void delegate(ServerMessage, Server) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "request-read", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when the server has started reading a new request.
	 *
	 * @message will be completely blank; not even the
	 * Request-Line will have been read yet. About the only thing
	 * you can usefully do with it is connect to its signals.
	 *
	 * If the request is read successfully, this will eventually
	 * be followed by a [signal@Server::request_read signal]. If a
	 * response is then sent, the request processing will end with
	 * a [signal@Server::request-finished] signal. If a network error
	 * occurs, the processing will instead end with
	 * [signal@Server::request-aborted].
	 *
	 * Params:
	 *     message = the new message
	 */
	gulong addOnRequestStarted(void delegate(ServerMessage, Server) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "request-started", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
