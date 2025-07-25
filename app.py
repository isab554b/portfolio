##############################
#   IMPORTS
#   Library imports
import logging
import os
from bottle import default_app, route, get, request, error, run, template, static_file, TEMPLATE_PATH, post
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

#   Local application imports
from common.colored_logging import setup_logger
import common.content as content
import master
from dotenv import load_dotenv

##############################
#   INITIALIZE APP
application = default_app()


##############################
#   COLORED LOGGING
try:
    logger = setup_logger(__name__, level=logging.INFO)
    logger.setLevel(logging.INFO)
    logger.success("Logging imported successfully.")
except Exception as e:
    logger.error(f"Error importing logging: {e}")
finally:
    logger.info("Logging import process completed.")

##############################
#   ROUTERS
try:
    logger.success("Routers imported successfully.")
except Exception as e:
    logger.error(f"Error importing routers: {e}")
finally:
    logger.info("Router import process completed.")

##############################
#   ERROR HANDLING
def handle_error(error_code, error):
    try:
        if error:
            logger.error(f"Handled {error_code} successfully with following error details: {error}")
            return template('error', 
                            title="Fejl", 
                            # A-Z
                            button_link=error_content['button_link'],
                            button_text=error_content['button_text'],
                            error=error,
                            error_message_text=error_content[str(error_code)]['error_message_text'],
                            error_title_text=error_content[str(error_code)]['error_title_text'],
                            header_text=error_content['header_text'],
                            illustration=error_content['illustration'],
                            illustration_alt=error_content['illustration_alt'],
                            )
        else:
            logger.success(f"Handled {error_code} response successfully with no errors.")
    except Exception as e:
        logger.error(f"Error handling {error_code} response: {e}")
    finally:
        logger.info(f"{error_code} error handling completed.")

@error(403)
def error403(error):
    return handle_error(403, error)

@error(404)
def error404(error):
    return handle_error(404, error)

@error(500)
def error500(error):
    return handle_error(500, error)

##############################
#   ICONS
try:
    project_root = os.path.dirname(os.path.abspath(__file__))
    assets_template_path = os.path.join(project_root, 'assets', 'icons')
    TEMPLATE_PATH.append(assets_template_path)
    logger.success("Icons path set successfully.")
except Exception as e:
    logger.error(f"Error setting icons path: {e}")
finally:
    logger.info("Icons path configuration completed.")

##############################
#   STATIC
def serve_static(filepath, root):
    try:
        logger.success(f"Static file {filepath} served successfully.")
        return static_file(filepath, root=root)
    except Exception as e:
        logger.error(f"Error serving static file {filepath}: {e}")
    finally:
        logger.info(f"Static file request completed for {filepath}.")

# CSS file
@get("/app.css")
def css_file_static():
    return serve_static('app.css', '.')

# Assets folder
@route('/assets/<filepath:path>')
def assets_folder_static(filepath):
    return serve_static(filepath, './assets')

# Static folder
@route('/static/<filepath:path>')
def static_folder(filepath):
    return serve_static(filepath, './static')



##############################
#   CONTENT (FROM CONTENT.PY)
try:
    # Global
    global_content = content.global_content
    error_content = content.error_content
    # Content for this page
    frontpage_content = content.frontpage_content
    about_us_content = content.about_us_content
    portfolio_content = content.portfolio_content
    contact_content = content.contact_content
    logger.success("Content imported successfully.")
except Exception as e:
    logger.error(f"Error importing content: {e}")
finally:
    logger.info("Content import process completed.")

##############################
#   INDEX
@get("/")
def index():
    page_name = "index"
    try:
        logger.success(f"Successfully showing template for {page_name}")
        return template(page_name, 
                        title="Isabella Hilarius Nielsen",
                        # A-Z 
                        about_us_content=about_us_content,
                        error_content=error_content,
                        frontpage_content=frontpage_content,
                        global_content=global_content,
                        portfolio_content=portfolio_content,
                        contact_content=contact_content,
                        )

    except Exception as e:
        logger.error(f"Error during request for /{page_name}: {e}")
        raise

    finally:
        logger.info(f"Completed request for /{page_name}")



##############################
#   CONTACT FORMULAR - SEND EMAIL
def send_email(subject, body, to_email):
    load_dotenv()
    from_email = os.getenv('EMAIL')
    from_password = os.getenv('EMAIL_PASSWORD')

    msg = MIMEMultipart()
    msg['From'] = from_email
    msg['To'] = to_email
    msg['Subject'] = subject

    msg.attach(MIMEText(body, 'plain'))

    try:
        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.starttls()
        server.login(from_email, from_password)
        print("Login successful")

        server.sendmail(from_email, to_email, msg.as_string())
        print("SUCCESS: Email sent successfully")
        
        server.quit()
    except Exception as e:
        print(f"Error: {e}")


@post('/send-email')
def send_email_handler():
    try:
        full_name = request.forms.get('full_name')
        email = request.forms.get('email')
        message = request.forms.get('message')
        website = request.forms.get('website')

        if website:
            logger.warning("Spam detected")
            return {"error": "Spam detected"}

        subject = f"Kontakformular - {full_name}"
        body = f"Navn: {full_name}\nEmail: {email}\n\nBesked:\n{message}"

        send_email(subject, body, 'isahilarius@hotmail.com')

        logger.success("Email sent successfully")
        return {"info": "Beskeden er blevet sendt!"}

    except Exception as e:
        logger.error(f"Error in send_email_handler: {e}")
        return {"error": "Der skete en fejl ved afsendelse af mail."}



##############################
#   PORTFOLIO IMPUT
@get("/imput")
def cases():

    page_name = "cases/imput"

    try:
        # Show template
        logger.success(f"Succesfully showing template for {page_name}")
        return template(page_name,
                        title="Portfolio: Imput",
                        # A-Z
                        global_content=global_content,
                        portfolio_content=portfolio_content,
                        )

    except Exception as e:
        raise

    finally:
        logger.info(f"Completed request for /{page_name}")

##############################
#   PORTFOLIO NOMI
@get("/nomi_creations")
def cases():

    page_name = "cases/nomi_creations"

    try:
        # Show template
        logger.success(f"Succesfully showing template for {page_name}")
        return template(page_name,
                        title="Portfolio: Nomi Creations ",
                        # A-Z
                        global_content=global_content,
                        portfolio_content=portfolio_content,
                        )

    except Exception as e:
        logger.error(f"Error during request for /{page_name}: {e}")
        raise

    finally:
        logger.info(f"Completed request for /{page_name}")

##############################
#   PORTFOLIO DRAGØR EL
@get("/dragoer_el_service")
def cases():

    page_name = "cases/dragoer_el_service"

    try:
        # Show template
        logger.success(f"Succesfully showing template for {page_name}")
        return template(page_name,
                        title="Portfolio: Dragør El-Service",
                        # A-Z
                        global_content=global_content,
                        portfolio_content=portfolio_content,
                        )

    except Exception as e:
        logger.error(f"Error during request for /{page_name}: {e}")
        raise

    finally:
        logger.info(f"Completed request for /{page_name}")


##############################
#   PORTFOLIO GL. DALVANG
@get("/gl_dalvang")
def cases():

    page_name = "cases/gl_dalvang"

    try:
        # Show template
        logger.success(f"Succesfully showing template for {page_name}")
        return template(page_name,
                        title="Portfolio: AB Gl. Dalvang",
                        # A-Z
                        global_content=global_content,
                        portfolio_content=portfolio_content,
                        )

    except Exception as e:
        logger.error(f"Error during request for /{page_name}: {e}")
        raise

    finally:
        logger.info(f"Completed request for /{page_name}")

##############################
#   PORTFOLIO UNID STUDIO
@get("/unid_studio")
def cases():

    page_name = "cases/unid_studio"

    try:
        # Show template
        logger.success(f"Succesfully showing template for {page_name}")
        return template(page_name,
                        title="Portfolio: UNID Studio",
                        # A-Z
                        global_content=global_content,
                        portfolio_content=portfolio_content,
                        )

    except Exception as e:
        logger.error(f"Error during request for /{page_name}: {e}")
        raise

    finally:
        logger.info(f"Completed request for /{page_name}")


##############################
#   PORTFOLIO STARDUST LAB
@get("/stardust_lab")
def cases():

    page_name = "cases/stardust_lab"

    try:
        # Show template
        logger.success(f"Succesfully showing template for {page_name}")
        return template(page_name,
                        title="Portfolio: Stardust Lab",
                        # A-Z
                        global_content=global_content,
                        portfolio_content=portfolio_content,
                        )

    except Exception as e:
        logger.error(f"Error during request for /{page_name}: {e}")
        raise

    finally:
        logger.info(f"Completed request for /{page_name}")

##############################
#   PORTFOLIO WIUFF BAGERI
@get("/wiuff_bageri")
def cases():

    page_name = "cases/wiuff_bageri"

    try:
        # Show template
        logger.success(f"Succesfully showing template for {page_name}")
        return template(page_name,
                        title="Portfolio: Wiuff Bageri",
                        # A-Z
                        global_content=global_content,
                        portfolio_content=portfolio_content,
                        )

    except Exception as e:
        logger.error(f"Error during request for /{page_name}: {e}")
        raise

    finally:
        logger.info(f"Completed request for /{page_name}")

##############################
#   PORTFOLIO CHARLASH
@get("/charlash")
def cases():

    page_name = "cases/charlash"

    try:
        # Show template
        logger.success(f"Succesfully showing template for {page_name}")
        return template(page_name,
                        title="Portfolio: Charlash",
                        # A-Z
                        global_content=global_content,
                        portfolio_content=portfolio_content,
                        )

    except Exception as e:
        logger.error(f"Error during request for /{page_name}: {e}")
        raise

    finally:
        logger.info(f"Completed request for /{page_name}")

##############################
#   PORTFOLIO DEALSOPHOLD
@get("/dealsophold")
def cases():

    page_name = "cases/dealsophold"

    try:
        # Show template
        logger.success(f"Succesfully showing template for {page_name}")
        return template(page_name,
                        title="Portfolio: Dealsophold",
                        # A-Z
                        global_content=global_content,
                        portfolio_content=portfolio_content,
                        )

    except Exception as e:
        logger.error(f"Error during request for /{page_name}: {e}")
        raise

    finally:
        logger.info(f"Completed request for /{page_name}")

##############################
#   LOCAL HOST
if __name__ == "__main__":
    try:
        logger.success("Running local server")
        run(host="127.0.0.1", port=2600, debug=True, reloader=True)
    except Exception as e:
        logger.error(f"Error running local server: {e}")
    finally:
        logger.info("Local host setup completed.")