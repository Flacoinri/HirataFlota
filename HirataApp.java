package hirata;

import hirata.modelo.Usuario;
import hirata.vista.LoginDialog;
import hirata.vista.VentanaPrincipal;

import javax.swing.*;

/**
 * Punto de entrada — Hirata Sistema de Gestión de Flota.
 *
 * Flujo:
 *   1. Muestra el LoginDialog.
 *   2. Si el login es exitoso, abre la VentanaPrincipal con el usuario autenticado.
 *   3. Si el usuario cierra el login sin autenticarse, termina la aplicación.
 *
 * En NetBeans:
 *   Clic derecho en proyecto → Properties → Run → Main Class → hirata.HirataApp
 */
public class HirataApp {

    public static void main(String[] args) {
        // Apariencia nativa del sistema operativo
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception ignored) { }

        SwingUtilities.invokeLater(() -> {
            // Mostrar login primero
            LoginDialog login = new LoginDialog();
            login.setVisible(true);

            Usuario usuario = login.getUsuarioAutenticado();
            if (usuario != null) {
                new VentanaPrincipal(usuario).setVisible(true);
            } else {
                // Cerró el login sin autenticarse
                System.exit(0);
            }
        });
    }
}
