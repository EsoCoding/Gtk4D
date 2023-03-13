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


module soup.ServerMessage;

private import gio.IOStream;
private import gio.Socket;
private import gio.SocketAddress;
private import gio.TlsCertificate;
private import glib.Bytes;
private import glib.Str;
private import glib.URI;
private import glib.c.functions;
private import gobject.ObjectG;
private import gobject.Signals;
private import soup.MessageBody;
private import soup.MessageHeaders;
private import soup.c.functions;
public  import soup.c.types;
private import std.algorithm;


/**
 * An HTTP server request and response pair.
 * 
 * A SoupServerMessage represents an HTTP message that is being sent or
 * received on a [class@Server].
 * 
 * [class@Server] will create `SoupServerMessage`s automatically for
 * incoming requests, which your application will receive via handlers.
 * 
 * Note that libsoup's terminology here does not quite match the HTTP
 * specification: in RFC 2616, an "HTTP-message" is *either* a Request, *or* a
 * Response. In libsoup, a #SoupServerMessage combines both the request and the
 * response.
 */
public class ServerMessage : ObjectG
{
	/** the main Gtk struct */
	protected SoupServerMessage* soupServerMessage;

	/** Get the main Gtk struct */
	public SoupServerMessage* getServerMessageStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return soupServerMessage;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)soupServerMessage;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (SoupServerMessage* soupServerMessage, bool ownedRef = false)
	{
		this.soupServerMessage = soupServerMessage;
		super(cast(GObject*)soupServerMessage, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return soup_server_message_get_type();
	}

	/**
	 * Get the HTTP version of @msg.
	 *
	 * Returns: a #SoupHTTPVersion.
	 */
	public SoupHTTPVersion getHttpVersion()
	{
		return soup_server_message_get_http_version(soupServerMessage);
	}

	/**
	 * Retrieves the [class@Gio.SocketAddress] associated with the local end
	 * of a connection.
	 *
	 * Returns: the #GSocketAddress
	 *     associated with the local end of a connection, it may be
	 *     %NULL if you used [method@Server.accept_iostream].
	 */
	public SocketAddress getLocalAddress()
	{
		auto __p = soup_server_message_get_local_address(soupServerMessage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(SocketAddress)(cast(GSocketAddress*) __p);
	}

	/**
	 * Get the HTTP method of @msg.
	 *
	 * Returns: the HTTP method.
	 */
	public string getMethod()
	{
		return Str.toString(soup_server_message_get_method(soupServerMessage));
	}

	/**
	 * Get the HTTP reason phrase of @msg.
	 *
	 * Returns: the reason phrase.
	 */
	public string getReasonPhrase()
	{
		return Str.toString(soup_server_message_get_reason_phrase(soupServerMessage));
	}

	/**
	 * Retrieves the [class@Gio.SocketAddress] associated with the remote end
	 * of a connection.
	 *
	 * Returns: the #GSocketAddress
	 *     associated with the remote end of a connection, it may be
	 *     %NULL if you used [class@Server.accept_iostream].
	 */
	public SocketAddress getRemoteAddress()
	{
		auto __p = soup_server_message_get_remote_address(soupServerMessage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(SocketAddress)(cast(GSocketAddress*) __p);
	}

	/**
	 * Retrieves the IP address associated with the remote end of a
	 * connection.
	 *
	 * Returns: the IP address associated with the remote
	 *     end of a connection, it may be %NULL if you used
	 *     [method@Server.accept_iostream].
	 */
	public string getRemoteHost()
	{
		return Str.toString(soup_server_message_get_remote_host(soupServerMessage));
	}

	/**
	 * Get the request body of @msg.
	 *
	 * Returns: a #SoupMessageBody.
	 */
	public MessageBody getRequestBody()
	{
		auto __p = soup_server_message_get_request_body(soupServerMessage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MessageBody)(cast(SoupMessageBody*) __p);
	}

	/**
	 * Get the request headers of @msg.
	 *
	 * Returns: a #SoupMessageHeaders with the request headers.
	 */
	public MessageHeaders getRequestHeaders()
	{
		auto __p = soup_server_message_get_request_headers(soupServerMessage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MessageHeaders)(cast(SoupMessageHeaders*) __p);
	}

	/**
	 * Get the response body of @msg.
	 *
	 * Returns: a #SoupMessageBody.
	 */
	public MessageBody getResponseBody()
	{
		auto __p = soup_server_message_get_response_body(soupServerMessage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MessageBody)(cast(SoupMessageBody*) __p);
	}

	/**
	 * Get the response headers of @msg.
	 *
	 * Returns: a #SoupMessageHeaders with the response headers.
	 */
	public MessageHeaders getResponseHeaders()
	{
		auto __p = soup_server_message_get_response_headers(soupServerMessage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MessageHeaders)(cast(SoupMessageHeaders*) __p);
	}

	/**
	 * Retrieves the [class@Gio.Socket] that @msg is associated with.
	 *
	 * If you are using this method to observe when multiple requests are
	 * made on the same persistent HTTP connection (eg, as the ntlm-test
	 * test program does), you will need to pay attention to socket
	 * destruction as well (eg, by using weak references), so that you do
	 * not get fooled when the allocator reuses the memory address of a
	 * previously-destroyed socket to represent a new socket.
	 *
	 * Returns: the #GSocket that @msg is
	 *     associated with, %NULL if you used [method@Server.accept_iostream].
	 */
	public Socket getSocket()
	{
		auto __p = soup_server_message_get_socket(soupServerMessage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Socket)(cast(GSocket*) __p);
	}

	/**
	 * Get the HTTP status code of @msg.
	 *
	 * Returns: the HTTP status code.
	 */
	public uint getStatus()
	{
		return soup_server_message_get_status(soupServerMessage);
	}

	/**
	 * Gets the peer's #GTlsCertificate associated with @msg's connection.
	 * Note that this is not set yet during the emission of
	 * SoupServerMessage::accept-certificate signal.
	 *
	 * Returns: @msg's TLS peer certificate,
	 *     or %NULL if @msg's connection is not SSL.
	 *
	 * Since: 3.2
	 */
	public TlsCertificate getTlsPeerCertificate()
	{
		auto __p = soup_server_message_get_tls_peer_certificate(soupServerMessage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TlsCertificate)(cast(GTlsCertificate*) __p);
	}

	/**
	 * Gets the errors associated with validating @msg's TLS peer certificate.
	 * Note that this is not set yet during the emission of
	 * SoupServerMessage::accept-certificate signal.
	 *
	 * Returns: a #GTlsCertificateFlags with @msg's TLS peer certificate errors.
	 *
	 * Since: 3.2
	 */
	public GTlsCertificateFlags getTlsPeerCertificateErrors()
	{
		return soup_server_message_get_tls_peer_certificate_errors(soupServerMessage);
	}

	/**
	 * Get @msg's URI.
	 *
	 * Returns: a #GUri
	 */
	public URI getUri()
	{
		auto __p = soup_server_message_get_uri(soupServerMessage);

		if(__p is null)
		{
			return null;
		}

		return new URI(cast(GUri*) __p);
	}

	/**
	 * Gets if @msg represents an OPTIONS message with the path `*`.
	 *
	 * Returns: %TRUE if is an OPTIONS ping
	 */
	public bool isOptionsPing()
	{
		return soup_server_message_is_options_ping(soupServerMessage) != 0;
	}

	/**
	 * Pauses I/O on @msg.
	 *
	 * This can be used when you need to return from the server handler without
	 * having the full response ready yet. Use [method@ServerMessage.unpause] to
	 * resume I/O.
	 *
	 * Since: 3.2
	 */
	public void pause()
	{
		soup_server_message_pause(soupServerMessage);
	}

	/**
	 * Set the HTTP version of @msg.
	 *
	 * Params:
	 *     version_ = a #SoupHTTPVersion
	 */
	public void setHttpVersion(SoupHTTPVersion version_)
	{
		soup_server_message_set_http_version(soupServerMessage, version_);
	}

	/**
	 * Sets @msg's status_code to @status_code and adds a Location header
	 * pointing to @redirect_uri. Use this from a [class@Server] when you
	 * want to redirect the client to another URI.
	 *
	 * @redirect_uri can be a relative URI, in which case it is
	 * interpreted relative to @msg's current URI. In particular, if
	 * @redirect_uri is just a path, it will replace the path
	 * *and query* of @msg's URI.
	 *
	 * Params:
	 *     statusCode = a 3xx status code
	 *     redirectUri = the URI to redirect @msg to
	 */
	public void setRedirect(uint statusCode, string redirectUri)
	{
		soup_server_message_set_redirect(soupServerMessage, statusCode, Str.toStringz(redirectUri));
	}

	/**
	 * Convenience function to set the response body of a #SoupServerMessage. If
	 * @content_type is %NULL, the response body must be empty as well.
	 *
	 * Params:
	 *     contentType = MIME Content-Type of the body
	 *     respUse = a #SoupMemoryUse describing how to handle @resp_body
	 *     respBody = a data buffer containing the body of the message response.
	 */
	public void setResponse(string contentType, SoupMemoryUse respUse, string respBody)
	{
		soup_server_message_set_response(soupServerMessage, Str.toStringz(contentType), respUse, Str.toStringz(respBody), cast(size_t)respBody.length);
	}

	/**
	 * Sets @msg's status code to @status_code.
	 *
	 * If @status_code is a known value and @reason_phrase is %NULL, the
	 * reason_phrase will be set automatically.
	 *
	 * Params:
	 *     statusCode = an HTTP status code
	 *     reasonPhrase = a reason phrase
	 */
	public void setStatus(uint statusCode, string reasonPhrase)
	{
		soup_server_message_set_status(soupServerMessage, statusCode, Str.toStringz(reasonPhrase));
	}

	/**
	 * "Steals" the HTTP connection associated with @msg from its #SoupServer. This
	 * happens immediately, regardless of the current state of the connection; if
	 * the response to @msg has not yet finished being sent, then it will be
	 * discarded; you can steal the connection from a
	 * [signal@ServerMessage::wrote-informational] or
	 * [signal@ServerMessage::wrote-body] signal handler if you need to wait for
	 * part or all of the response to be sent.
	 *
	 * Note that when calling this function from C, @msg will most
	 * likely be freed as a side effect.
	 *
	 * Returns: the #GIOStream formerly associated
	 *     with @msg (or %NULL if @msg was no longer associated with a
	 *     connection). No guarantees are made about what kind of #GIOStream
	 *     is returned.
	 */
	public IOStream stealConnection()
	{
		auto __p = soup_server_message_steal_connection(soupServerMessage);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(IOStream)(cast(GIOStream*) __p, true);
	}

	/**
	 * Resumes I/O on @msg.
	 *
	 * Use this to resume after calling [method@ServerMessage.pause], or after
	 * adding a new chunk to a chunked response. I/O won't actually resume until you
	 * return to the main loop.
	 *
	 * Since: 3.2
	 */
	public void unpause()
	{
		soup_server_message_unpause(soupServerMessage);
	}

	/**
	 * Emitted during the @msg's connection TLS handshake
	 * after client TLS certificate has been received.
	 * You can return %TRUE to accept @tls_certificate despite
	 * @tls_errors.
	 *
	 * Params:
	 *     tlsPeerCertificate = the peer's #GTlsCertificate
	 *     tlsPeerErrors = the tls errors of @tls_certificate
	 *
	 * Returns: %TRUE to accept the TLS certificate and stop other
	 *     handlers from being invoked, or %FALSE to propagate the
	 *     event further.
	 */
	gulong addOnAcceptCertificate(bool delegate(TlsCertificate, GTlsCertificateFlags, ServerMessage) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "accept-certificate", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when the @msg's socket is connected and the TLS handshake completed.
	 */
	gulong addOnConnected(void delegate(ServerMessage) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "connected", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when the @msg's socket is disconnected.
	 */
	gulong addOnDisconnected(void delegate(ServerMessage) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "disconnected", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted when all HTTP processing is finished for a message.
	 * (After [signal@ServerMessage::wrote-body]).
	 */
	gulong addOnFinished(void delegate(ServerMessage) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "finished", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted after receiving the complete request body.
	 */
	gulong addOnGotBody(void delegate(ServerMessage) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "got-body", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted after receiving a chunk of a message body.
	 *
	 * Note that "chunk" in this context means any subpiece of the body, not
	 * necessarily the specific HTTP 1.1 chunks sent by the other side.
	 *
	 * Params:
	 *     chunk = the just-read chunk
	 */
	gulong addOnGotChunk(void delegate(Bytes, ServerMessage) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "got-chunk", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted after receiving the Request-Line and request headers.
	 */
	gulong addOnGotHeaders(void delegate(ServerMessage) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "got-headers", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted immediately after writing the complete response body for a
	 * message.
	 */
	gulong addOnWroteBody(void delegate(ServerMessage) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "wrote-body", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted immediately after writing a portion of the message
	 * body to the network.
	 *
	 * Params:
	 *     chunkSize = the number of bytes written
	 */
	gulong addOnWroteBodyData(void delegate(uint, ServerMessage) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "wrote-body-data", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted immediately after writing a body chunk for a message.
	 *
	 * Note that this signal is not parallel to
	 * [signal@ServerMessage::got-chunk]; it is emitted only when a complete
	 * chunk (added with [method@MessageBody.append] or
	 * [method@MessageBody.append_bytes] has been written. To get
	 * more useful continuous progress information, use
	 * [signal@ServerMessage::wrote-body-data].
	 */
	gulong addOnWroteChunk(void delegate(ServerMessage) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "wrote-chunk", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted immediately after writing the response headers for a
	 * message.
	 */
	gulong addOnWroteHeaders(void delegate(ServerMessage) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "wrote-headers", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Emitted immediately after writing a 1xx (Informational) response.
	 */
	gulong addOnWroteInformational(void delegate(ServerMessage) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "wrote-informational", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
